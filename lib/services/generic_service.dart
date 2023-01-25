import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/managers/login_manager.dart';

import '../utils/error_handler.dart';

const baseURL = "http://10.0.2.2:3000";
//const baseURL = "https://192.168.0.108:3000";
enum RequestMethod {
  get,
  post,
  put,
  delete
}


class PZService {
  final baseURI = baseURL;
  static Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static void catchErrorWithScaffoldMessenger(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      content: Text(error.toString(), style: const TextStyle(fontSize: 18), textAlign: TextAlign.center,),
      duration: const Duration(seconds: 10),
      backgroundColor: const Color(0xff993366),
    ));
  }

  Future<T> apiRequest<T>(
      String endPoint,
      RequestMethod method,
      T Function(Map<String, dynamic> json) fromJson,
      {String body = '', String token = ''}) async {
    http.Response? response;
    final Uri url = Uri.parse(baseURI + endPoint);
    final Map<String, String> headers = <String, String>{};

    headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
    headers.putIfAbsent(HttpHeaders.acceptHeader, () => 'application/json');
    log("DEBUG: endPoint: ${url.toString()}, headers: ${jsonEncode(headers)}");
    if (token.isNotEmpty) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer $token');
    }
    try {
      if (method == RequestMethod.get) {
        response = await http.get(
          url,
          headers: headers,
        );
        log(response.body);
      } else if (method == RequestMethod.put) {
        response = await http.put(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.post) {
        response = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        response = await http.delete(
          url,
          headers: headers,
        );
      }
      var json = jsonDecode(processResponse(response as http.Response)); //
      return fromJson(json["data"]);
    } catch(exception) {
      throw errorHandler(exception);
    }
  }

  Future<List<T>> apiRequestWithList<T>(
      String endPoint,
      RequestMethod method,
      T Function(Map<String, dynamic> json) fromJson,
      {String body = '', String token = ''}) async {
    http.Response? response;
    final Uri url = Uri.parse(baseURI + endPoint);
    final Map<String, String> headers = <String, String>{};

    headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
    headers.putIfAbsent(HttpHeaders.acceptHeader, () => 'application/json');
    log("DEBUG: endPoint: $endPoint, headers: ${jsonEncode(headers)}");
    if (token.isNotEmpty) {
      headers.putIfAbsent(
          HttpHeaders.authorizationHeader, () => 'Bearer $token');
    }
    try {
      if (method == RequestMethod.get) {
        response = await http.get(
          url,
          headers: headers,
        );
      } else if (method == RequestMethod.put) {
        response = await http.put(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.post) {
        response = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        response = await http.delete(
          url,
          headers: headers,
        );
      }
      var responseData = json.decode(processResponse(response as http.Response));
      //log(json.decoder(responseData));
      /*var jsonList = responseData["data"];
      return jsonList.map((json) => fromJson(json)).toList();*/
      return [];
    } catch(exception) {
      throw errorHandler(exception);
    }

  }

}