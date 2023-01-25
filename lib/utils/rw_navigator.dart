import 'package:flutter/material.dart';

void pushToScreen(BuildContext context, Widget moveToScreen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return moveToScreen;
  }));
}