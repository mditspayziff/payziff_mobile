import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:untitled/managers/login_manager.dart';
import 'package:untitled/screens/wallet_screen.dart';
import 'package:untitled/services/generic_service.dart';
import 'package:untitled/models/response_dto.dart';
import '../managers/loading_state.dart';

class PhoneScreen extends StatelessWidget {

  const PhoneScreen({super.key});


  _verifyPhone(BuildContext context) async {
    LoginManager loginManager = Provider.of<LoginManager>(context, listen: false);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+1 650-234-2344',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const WalletScreen()),
                      (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          //print(e.message);
        },
        codeSent: (String? verificationId, int? resendToken) {
          loginManager.verificationId = verificationId as String;
          log("code: ${loginManager.verificationId}");
          loginManager.isOTPReceived = true;
          loginManager.state = Loader.idle;
        },
        codeAutoRetrievalTimeout: (String verificationID) {

        },
        timeout: const Duration(seconds: 120));
  }

  Widget otpContainer(BuildContext context) {
    LoginManager loginManager = Provider.of<LoginManager>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "PayZiff",
          style: TextStyle(fontSize: 45, color: Colors.blue),
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          "Verification",
          style: TextStyle(fontSize: 34, color: Colors.black54),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Enter OTP",
            style: TextStyle(fontSize: 16, color: Colors.black45),
            textAlign: TextAlign.center)
         ,
        const SizedBox(
          height: 40,
        ),
        OtpTextField(
          numberOfFields: 6,
          borderColor: const Color(0xFF512DA8),
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //loginManager.otp = code;
            //log(loginManager.otp);
          },
          onSubmit: (code) {
            loginManager.otp = code;
            log(loginManager.otp);
          },// end onSubmit
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
            height: 45,
            width: 140,
            child: ElevatedButton(
                onPressed: () async {
                  loginManager.state = Loader.waiting;
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: loginManager.verificationId, smsCode: loginManager.otp);
                  await FirebaseAuth.instance
                      .signInWithCredential(credential)
                      .then((value) async {
                        loginManager.state = Loader.idle;
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const WalletScreen()),
                              (route) => false);
                    }
                  });
                },
                style:
                ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("Verify"))
        )
      ],
    );
  }

  Widget phoneContainer(BuildContext context) {

    LoginManager loginManager = Provider.of<LoginManager>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "PayZiff",
          style: TextStyle(fontSize: 45, color: Colors.blue),
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          "Verification",
          style: TextStyle(fontSize: 34, color: Colors.black54),
        ),
        const SizedBox(
          height: 20,
        ),const Text(
          "We will send you otp on phone number \n+91 7001329865",
          style: TextStyle(fontSize: 16, color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        TextFormField(
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blue, width: 1.5))
              ),
          onChanged: (val) {
            loginManager.phoneNumber = val;
          },
        ),
        const SizedBox(height: 40,),
        SizedBox(
            height: 45,
            width: 140,
            child: ElevatedButton(
                onPressed: () async {
                  loginManager.state = Loader.waiting;
                  PZService().apiRequest("/auth/login/${loginManager.phoneNumber}", RequestMethod.get,
                          (json) => ResponseDTO.fromJson(json)).then((response) {
                    log(jsonEncode(response));
                      if (response.status == true) {
                        _verifyPhone(context);
                      }
                  }).catchError((error) {
                    loginManager.state = Loader.idle;
                    PZService.catchErrorWithScaffoldMessenger(context, error);
                  });
                },
                style:
                ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Consumer<LoginManager>(
                  builder: (context, manager, child) {
                    if (manager.state == Loader.waiting) {
                      return const CircularProgressIndicator(color: Colors.white,);
                    }
                    return const Text("Submit");
                  },
                )))

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginManager loginManager = Provider.of<LoginManager>(context);
    return Scaffold(
        body: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          color: Colors.white24,
          child: Consumer<LoginManager>(
            builder: (context, manager, child) {
              if (manager.isOTPReceived) {
                return otpContainer(context);
              }
              return phoneContainer(context);
            },
          ),
        ),
      )
    );
  }

}

//_isLoading ? const CircularProgressIndicator(color: Colors.white,) : (_isOTPReceived ? const Text("VERIFY") :  const Text("GET OTP"))
