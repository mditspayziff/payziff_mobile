import 'dart:convert';
import 'dart:developer';

import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:untitled/components/merchange_appbar.dart';
import 'package:untitled/screens/customer_bank_details_screen.dart';
import 'package:untitled/services/generic_service.dart';

import '../models/transaction_dto.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<TransactionDTO> transactionDTOList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    
    PZService().apiRequestWithList("/transactions/getAllTransactions", RequestMethod.get, (json) => TransactionDTO.fromJson(json))
    .then((transactions) {
      setState(() {
        transactionDTOList = transactions;
        //log(jsonEncode(transactionDTOList));
      });
    }).catchError((error) {
      // add snakbar messenger
      log(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MerchantAppBar(tabController: _tabController, child: _mainContainer(context),);
  }

  Widget dataRow(
      {required String key,
        required String val,
        TextStyle? keyStyle,
        TextStyle? valStyle}) {
    TextStyle kStyle = GoogleFonts.inter(fontSize: 16, color: Colors.black);
    TextStyle vStyle = GoogleFonts.inter(fontSize: 16, color: Colors.black);
    return Container(
      margin: const EdgeInsets.all(4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text("$key: ", style: keyStyle ?? kStyle),
          ),
          Expanded(
              child: Text(
                val,
                style: keyStyle ?? kStyle,
                overflow: TextOverflow.visible,
              )),
        ],
      ),
    );
  }

  Widget infoCard(TransactionDTO data) {
    return Card(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.all(10),
              color: const Color(0xffE2EFFF),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Reference ID: "),
                  Text("1012345600"),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  children: [
                    dataRow(key: "Tx Date", val: data.createdAt),
                    dataRow(key: "Tx ID", val: data.orderId.toString()),
                  ]
            ))
          ],
        )
    );
  }

  Widget _mainContainer(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: TabBarView(
            controller: _tabController,
            children: [
              tabData(),
              tabData(),
              tabData()
            ],
          )
      );
  }

  Widget tabData() {
    return Column(
      children: [
        Expanded(
            child: SearchableList<TransactionDTO>(
              initialList: transactionDTOList,
              builder: (data) {
                return infoCard(data);
              },
              filter: (value) => transactionDTOList.where((element) => false).toList(),
              inputDecoration: InputDecoration(
                labelText: "Search",
                labelStyle: const TextStyle(color: Color(0xff993366)),
                fillColor: Colors.blue.withOpacity(0.1),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
        )
      ],
    );
  }

}
