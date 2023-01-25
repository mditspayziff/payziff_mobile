import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/managers/login_manager.dart';
import 'package:untitled/managers/payout_manager.dart';
import 'package:untitled/profile/profile.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:untitled/screens/merchant_dashboard.dart';
import 'package:untitled/screens/otp_screen.dart';
import 'package:untitled/screens/phone_screen.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/wallet_screen.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginManager>(create: (context) => LoginManager()),
        ChangeNotifierProvider<PayoutManager>(create: (context) => PayoutManager())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
            primarySwatch: Colors.blue,
            buttonTheme: const ButtonThemeData(
            ),
            textTheme: TextTheme(
              headline1: GoogleFonts.outfit(color: Colors.white, fontSize: 34),
              headline2: const TextStyle(color: Colors.deepPurpleAccent),
              bodyText2: const TextStyle(color: Colors.deepPurpleAccent),
              subtitle1: const TextStyle(color: Colors.pinkAccent),
            ),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: const TextStyle(color: Colors.black12),
              labelStyle: const TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.blue.withOpacity(0.1),
              contentPadding: const EdgeInsets.only(top: 15, bottom: 15, left:10),
            )
        ),
        home: MerchantDashboard()
      ),
    );
  }
}