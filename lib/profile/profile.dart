import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/screens/merchant_dashboard.dart';
import 'package:provider/provider.dart';

import '../managers/login_manager.dart';
typedef OnClick = void Function();


class MDITSProfile extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final OnClick onClick;
  Image? image;


  MDITSProfile({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.onClick,
    this.image
  });

  @override
  State<MDITSProfile> createState() => _MDITSProfileState();
}

class _MDITSProfileState extends State<MDITSProfile> {

  final Image? defaultImage = Image.file(File("/lib/profile_image.jpg"));


  Widget dataRow(Widget icon, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 20),
          Text(value, style: const TextStyle(color: Colors.black54, fontSize: 18))
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          color: Colors.white24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.blue, size: 18,),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                          return ChangeNotifierProvider<LoginManager>(
                            create: (context) => LoginManager(),
                            child: MerchantDashboard(),
                          );
                        }));
                      }
                    ),
                    const SizedBox(width: 100),
                    const Text("Profile", style: TextStyle(fontSize: 24, color: Colors.blue),),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 50,),
              ),const SizedBox(height: 15,),
              Text(widget.name, style: const TextStyle(color: Colors.black54, fontSize: 18)),
              const SizedBox(height: 40,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    dataRow(
                        const Icon(Icons.person_outline, color: Colors.blue,),
                        widget.name
                    ),
                    dataRow(
                        const Icon(Icons.email_outlined, color: Colors.blue,),
                        widget.email
                    ),
                    dataRow(
                        const Icon(Icons.phone_android, color: Colors.blue,),
                        widget.phoneNumber
                    ),
                    InkWell(
                      child: dataRow(const Icon(Icons.logout, color: Colors.blue), "Sign out"),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
