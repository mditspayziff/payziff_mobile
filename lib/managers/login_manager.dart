import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:untitled/managers/loading_state.dart';

class LoginManager extends ChangeNotifier implements LoaderState {

  bool _isOTPReceived = false;
  String _phoneNumber = "";
  String _verificationId = "";
  String _otp = "";
  LoginManager(): _state = Loader.idle;

  Future<dynamic> logIn() {
    state = Loader.waiting;
    return Future.delayed(const Duration(seconds: 4));
  }

  Loader _state;

  @override
  Loader get state => _state;

  bool get isOTPReceived => _isOTPReceived;

  String get verificationId => _verificationId;

  String get otp => _otp;

  String get phoneNumber => _phoneNumber;

  @override
  set state(Loader state) {
    _state = state;
    notifyListeners();
  }

  set isOTPReceived(bool val) {
    _isOTPReceived = val;
    notifyListeners();
  }


  set verificationId(String verificationId) {
    _verificationId = verificationId;
    notifyListeners();
  }

  set otp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  set phoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}