import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(msgText) => Fluttertoast.showToast(
    msg: msgText,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.grey,
    textColor: Colors.black,
    fontSize: 12.0);
