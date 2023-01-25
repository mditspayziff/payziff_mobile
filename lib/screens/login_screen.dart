import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

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
                height: screenHeight * 0.5,
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
                height: screenHeight * 0.5,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                color: const Color(0xff013B84),
                child: Column(
                  children: [
                    Text("Login", style: textTheme.headline1,),
                    const SizedBox(height: 40,),
                    SizedBox(
                        height: 80,
                        width: screenWidth * 0.85,
                        child: TextField(
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  )
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                color: Colors.white,
                                  width: 2.0,
                                )
                              ),
                              fillColor: Colors.brown.withOpacity(0.2),
                              labelStyle: const TextStyle(color: Colors.white24 ),
                              labelText: 'Mobile Number',
                              helperStyle: const TextStyle(color: Colors.white ),
                              prefixIcon: Container(
                                 margin: const EdgeInsets.only(right: 20),
                                  decoration: const BoxDecoration(
                                    border: Border.symmetric(vertical: BorderSide(color: Colors.white, width: 2.0))
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                          child: Text(
                                            '+91',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                      ),
                                    ],
                                  )
                              )
                          ),
                          onChanged: (value) {
                            if (value.length == 10) {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          maxLength: 10,
                        )
                    ),
                    const SizedBox(height: 30,),
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
