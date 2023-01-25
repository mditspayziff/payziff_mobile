import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/components/merchange_appbar.dart';
import 'package:untitled/screens/customer_bank_details_screen.dart';
import 'package:provider/provider.dart';
import '../managers/payout_manager.dart';
import 'beneficiarys_screen.dart';

class PayToCustomer extends StatelessWidget {
  const PayToCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return MerchantAppBar(child: _mainContainer(context));
  }

  Widget _mainContainer(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Amount To Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 24)
                ),
                Consumer<PayoutManager>(
                  builder: (BuildContext context, manager, Widget? child) {
                    return FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("Wallet balance ${manager.balanceDTO.data.availableBalance}",
                            style: const TextStyle(color: Colors.white, fontSize: 16)
                        )
                    );
                  },
                )
              ],
            )
        ),
        Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  width: screenWidth * 0.95,
                  child: TextField(
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
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
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                              return const BeneficiaryScreen();
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
