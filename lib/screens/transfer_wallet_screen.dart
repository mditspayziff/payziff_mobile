import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/components/merchange_appbar.dart';

import 'cashfree_pg_screen.dart';

class TransferToWallet extends StatelessWidget {
  const TransferToWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MerchantAppBar(child: _mainContainer(context));
  }

  Widget _mainContainer(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text("Add Money to Wallet",
                    style: TextStyle(color: Colors.white, fontSize: 24)
                )
              ],
            )
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: screenWidth * 0.95,
                  child: TextField(
                    style: const TextStyle(fontSize: 16, color: Colors.white),
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
                        fillColor: Colors.blue.withOpacity(0.2),
                        labelStyle: const TextStyle(color: Colors.black38 ),
                        labelText: 'Enter Amount',
                        helperStyle: const TextStyle(color: Colors.white ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15)
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
                  ),
                ),
                const SizedBox(height: 40,),
                Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 45,
                      width: 120,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return const CashFrePayment();
                                }));
                          },
                          child: const Text("Add", style: TextStyle(fontSize: 21))
                      ),
                    )
                )
              ],
            )
        )
      ],
    );
  }
}
