import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/components/merchange_appbar.dart';
import 'package:untitled/screens/customer_bank_details_screen.dart';

class BeneficiaryScreen extends StatelessWidget {
  const BeneficiaryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return MerchantAppBar(child: _mainContainer(context));
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
            width: 70,
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

  Widget infoCard(List<Pair<String, String>> data) {
    return Card(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              color: const Color(0xff93C3FF),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                   padding: const EdgeInsets.only(left: 10),
                   decoration: const BoxDecoration(
                     border: Border(top: BorderSide(color: Colors.black12),
                         right: BorderSide(color: Colors.black12),
                         left: BorderSide(color: Colors.black12))
                   ),
                   child: Row(
                     children: const [
                       Text("Beneficiary ID: ", style: TextStyle(color: Colors.black),),
                       SizedBox(width: 30,),
                       Text("1000", style: TextStyle(color: Colors.black)),
                     ],
                   ),
                 ),
                  Row(
                    children: const [
                      Icon(
                        Icons.edit,
                        color: Color(0xff013B84),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        child:Icon(
                          Icons.open_in_new,
                          color: Color(0xff013B84),
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: const Color(0xffffffff)
              ),
              child: Column(
                  children: data
                      .map<Widget>(
                          (item) => dataRow(key: item.first, val: item.last))
                      .toList()),
            )
          ],
        ));
  }

  Widget _mainContainer(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40,),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
                onPressed: () {}, child: const Text("Add Beneficiary")),
          ),const SizedBox(height: 20,),
          infoCard([
            Pair("Name", "Hari"),
            Pair("Email", "test@gmail.com"),
            Pair("Mobile", "+91 7013298534"),
            Pair("Aadhar", "2587-5685-9856")
          ]),
          infoCard([
            Pair("Name", "Hari"),
            Pair("Email", "test@gmail.com"),
            Pair("Mobile", "+91 7013298534"),
            Pair("Aadhar", "2587-5685-9856")
          ]),
          infoCard([
            Pair("Name", "Hari"),
            Pair("Email", "test@gmail.com"),
            Pair("Mobile", "+91 7013298534"),
            Pair("Aadhar", "2587-5685-9856")
          ]),
          infoCard([
            Pair("Name", "Hari"),
            Pair("Email", "test@gmail.com"),
            Pair("Mobile", "+91 7013298534"),
            Pair("Aadhar", "2587-5685-9856")
          ])
        ],
      ),
    );
  }
}
