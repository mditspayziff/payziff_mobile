import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/components/merchange_appbar.dart';
import 'package:untitled/managers/payout_manager.dart';
import 'package:untitled/screens/transfer_wallet_screen.dart';
import 'package:provider/provider.dart';
import 'Transactions.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MerchantAppBar(
      child: _mainContainer(context),
    );
  }

  Widget _mainContainer(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            height: 300,
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Wallet Balance",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 20))),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<PayoutManager>(
                    builder: (BuildContext context, manager, Widget? child) {
                      return FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text("\u20B9${manager.balanceDTO.data.availableBalance}",
                              style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 34, color: Colors.white)))
                          );
                    },
                  )
                ],
              ),
            )
        ),
        Positioned(
            top: 260,
            left: 20,
            right: 20,
            height: 80,
            child: InkWell(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1.0,
                            offset: Offset(1, 1)),
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1.0,
                            offset: Offset(-1, -1))
                      ]),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.collections_bookmark_outlined,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 30),
                      Text("Add Money",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.black87,
                              textStyle: const TextStyle(fontSize: 20))),
                      const SizedBox(width: 100),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const TransferToWallet();
                  }));
                })),
        Positioned(
            top: 350,
            left: 20,
            right: 20,
            height: 80,
            child: InkWell(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1.0,
                            offset: Offset(1, 1)),
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1.0,
                            offset: Offset(-1, -1))
                      ]),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.collections_bookmark_outlined,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 30),
                      Text("Transactions",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.black87,
                              textStyle: const TextStyle(fontSize: 20))),
                      const SizedBox(width: 100),
                      const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const Transactions();
                  }));
                }))
      ],
    );
  }
}
