import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/components/merchange_appbar.dart';
import 'package:untitled/screens/customer_bank_details_screen.dart';

class SubMerchants extends StatelessWidget {
  const SubMerchants({super.key});

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
              height: 40,
              padding: const EdgeInsets.all(10),
              color: const Color(0xffE2EFFF),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("ID: "),
                  Text("1000"),
                  Icon(
                    Icons.edit,
                    color: Color(0xff013B84),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
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
                onPressed: () {}, child: const Text("Add Sub Merchant")),
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
