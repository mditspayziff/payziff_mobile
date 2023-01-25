import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

String errorHandler(Object exception) {
  if (exception is InternalServerException) {
    return exception.message.toString();
  } else if (exception is SocketException) {
    return "No internet connection";
  } else if( exception is HttpException) {
    return "Post not round";
  } else if (exception is FormatException){
    return "Bad response format";
  } else if (exception is TimeoutException) {
    return 'Request timedout.';
  } else if (exception is BadRequestException) {
    return exception.message.toString();
  } else if (exception is UnAuthorizedException) {
    return exception.message.toString();
  } else if (exception is NotFoundException) {
    return exception.message.toString();
  } else if (exception is FetchDataException) {
    return exception.message.toString();
  } else if (exception is OfferPurchasedException) {
    return exception.message.toString();
  } else {
    return 'Unknown exception occurred.';
  }
  return "exception not known";

}


class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

dynamic processResponse(http.Response response) {
  //log("DEBUG: response: ${response.body}");
  log("DEBUG: processResponse: status: ${response.statusCode}");
  switch (response.statusCode) {
    case 200:
      var responseJson = response.body;
      return response.body;
    case 201:
      var responseJson = response.body;
      return responseJson;
    case 208:
      return ResourceAlreadyExistsException(jsonDecode(response.body)['message']);
    case 400: //Bad request
      throw BadRequestException(jsonDecode(response.body)['message']);
    case 401: //Unauthorized
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    case 403: //Forbidden
      throw UnAuthorizedException(jsonDecode(response.body)['message']);
    case 404: //Resource Not Found
      throw NotFoundException(jsonDecode(response.body)['message']);
    case 500:
      throw InternalServerException(jsonDecode(response.body)['message']);
    default:
      throw FetchDataException(
          'Something went wrong! ${response.statusCode}');
  }
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process the request', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responding', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'Unauthorized request', url);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, String? url])
      : super(message, 'Page not found', url);
}

class InternalServerException extends AppException {
  InternalServerException([String? message, String? url])
      : super(message, 'Internal server error', url);
}


class OfferPurchasedException extends AppException {
  OfferPurchasedException([String? message, String? url])
      : super(message, 'Offer already purchased by customer', url);
}


class ResourceAlreadyExistsException extends AppException {
  ResourceAlreadyExistsException([String? message, String? url])
      : super(message, 'vendor already added previously', url);
}