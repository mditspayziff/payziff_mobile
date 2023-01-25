import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/components/text_field.dart';

import '../components/merchange_appbar.dart';

class CustomerBankDetails extends StatelessWidget {
  const CustomerBankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return MerchantAppBar(child: _mainContainer());
  }

  Widget _mainContainer() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          children: [
            Row(
                children: const [
                  Text("Name(as per bank records) ", style: TextStyle(fontSize: 16)),
                  Text("*", style: TextStyle(color: Colors.red))
                ]
            ),
            const SizedBox(height: 5,),
            const RWTextFormField(
              label: "Enter Name",
            ),
            const SizedBox(height: 15,),
            Row(
                children: const [
                  Text("Bank Account Number ", style: TextStyle(fontSize: 16)),
                  Text("*", style: TextStyle(color: Colors.red))
                ]
            ),
            const SizedBox(height: 5,),
            const RWTextFormField(
              label: "Enter Bank Account Details",
            ),
            const SizedBox(height: 15,),
            Row(
                children: const [
                  Text("Confirm Account Number ", style: TextStyle(fontSize: 16)),
                  Text("*", style: TextStyle(color: Colors.red))
                ]
            ),
            const SizedBox(height: 5,),
            const RWTextFormField(
              label: "Confirm Account Number",
            ),
            const SizedBox(height: 15,),
            Row(
                children: const [
                  Text("IFSC Code ", style: TextStyle(fontSize: 16)),
                  Text("*", style: TextStyle(color: Colors.red))
                ]
            ),
            const SizedBox(height: 5,),
            const RWTextFormField(
              label: "IFSC Code",
            ),
            const SizedBox(height: 25,),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  color: Color(0x0F013B84)
              ),
              child: Column(
                children: [
                  const Text("Amount Details"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Amount"),
                      Text("20,0000")
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Processing Amount"),
                      Text("220.00")
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("GST Charge"),
                      Text("40.00")
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total Amount"),
                      Text("40.00")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide())
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Make Payment"),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
