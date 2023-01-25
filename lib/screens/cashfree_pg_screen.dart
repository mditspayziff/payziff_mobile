import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
import 'package:http/http.dart' as http;

import '../secret_keys.dart';


class CashFrePayment extends StatefulWidget {
  const CashFrePayment({Key? key}) : super(key: key);

  @override
  State<CashFrePayment> createState() => _MyAppState();
}

class _MyAppState extends State<CashFrePayment> {

  var cfPaymentGatewayService = CFPaymentGatewayService();
  String orderId = "";
  String orderToken = "";

  Future<http.Response> getOrderDetails(String orderId) async {
    Uri url = Uri.parse("http://10.0.2.2:3000/generateToken");
    http.Response response = await http.get(url);
    return response;
  }

  @override
  void initState() {
    super.initState();
    cfPaymentGatewayService.setCallback(verifyPayment, onError);
  }

  @override
  Widget build(BuildContext context) {
    return _mainContainer();
  }

  Widget _mainContainer() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100,),
          TextButton(
              onPressed: () {
                try {
                  getOrderDetails("123465").then((response) {
                    var json = jsonDecode(response.body);
                    log(jsonEncode(json));
                    pay(json["orderId"], json["orderToken"]);
                  }).catchError((err) {
                    log("catch2: ${err.toString()}");
                  });
                } catch(e) {
                  log("catch2: ${e.toString()}");
                }

              },
              child: const Text("Pay"))
        ],
      ),
    );
  }

  void verifyPayment(String orderId) {
    print("Verify Payment");
  }

  void onError(CFErrorResponse errorResponse, String orderId) {
    print("Error while making payment");
  }

  CFEnvironment environment = CFEnvironment.SANDBOX;

  CFSession? createSession(String sessionId, String sessionToken) {
    try {
      var session = CFSessionBuilder()
          .setEnvironment(environment).setOrderId(sessionId).setPaymentSessionId(sessionToken).build();
      return session;
    } on CFException catch (e) {
      log("session: ${e.message}");
    }
    return null;
  }

  pay(String sessionId, String sessionToken) async {
    try {
      var session = createSession(sessionId, sessionToken);
      //log(jsonEncode(session));
      List<CFPaymentModes> components = <CFPaymentModes>[];
      components.add(CFPaymentModes.CARD);
      var paymentComponent = CFPaymentComponentBuilder().setComponents(components).build();

      var theme = CFThemeBuilder()
          .setNavigationBarBackgroundColorColor("#993366")
          .setPrimaryFont("Menlo")
          .setSecondaryFont("Futura")
          .setButtonBackgroundColor("#993366")
          .build();
      if (session != null) {
        var cfDropCheckoutPayment = CFDropCheckoutPaymentBuilder()
            .setSession(session)
            .setPaymentComponent(paymentComponent)
            .setTheme(theme)
            .build();
        cfPaymentGatewayService.doPayment(cfDropCheckoutPayment);
      }
    } on CFException catch (e) {
      log("test: ${e.message}");
    }

  }

}