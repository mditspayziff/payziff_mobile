import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.45,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/login_screen_top.png"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.65,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                color: const Color(0xff013B84),
                child: Column(
                  children: [
                    Text("OTP Verification", style: textTheme.headline1,),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Enter the OTP sent to", style: TextStyle(color: Colors.white24),),
                        Text("+91 9587423158", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    OtpTextField(
                      numberOfFields: 6,
                      fieldWidth: 50,
                      borderColor: const Color(0xFF512DA8),
                      showFieldAsBox: false,
                      onCodeChanged: (String code) {
                        //loginManager.otp = code;
                        //log(loginManager.otp);
                      },
                      onSubmit: (code) {
                      },// end onSubmit
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Didn't receive an OTP?", style: TextStyle(color: Colors.white24),),
                        TextButton(onPressed: null, child: Text("Resend OTP", style: TextStyle(color: Colors.red),))
                      ],
                    ),
                    const SizedBox(height: 40,),
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {  },
                        child: const Text("Send OTP"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

