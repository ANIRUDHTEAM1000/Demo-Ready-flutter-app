// ignore_for_file: avoid_print
import 'dart:io' show Platform;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:rpay/login/models/login_user.dart';
import 'package:http/http.dart' as http;

class LoginUserProvider extends ChangeNotifier {
  late User _user;
  late int _balance;

  // methods
  User get user => _user;
  int get balance => _user.balance;

  fetchData(String userId) async {
    // get uri from config.yaml
    Uri uri =
        Uri.parse('http://' + returnHost() + ':8080/walletengine/user/$userId');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        _user = userFromJson(response.body);
        _balance = _user.balance;
      } else {
        print("Some error has occured");
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  updateBalance(String userId) async {
    // print(userId);
    Uri uri = Uri.parse(
        'http://' + returnHost() + ':8080/walletengine/balance/$userId');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        _balance = int.parse(response.body);
      } else {
        print("Some error has occured");
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<String> transfer(String receiver, String amount) async {
    Map data = {
      "sender": _user.userLoginId,
      "receiver": receiver,
      "amount": int.parse(amount.toString().replaceAll(',', ''))
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = json.encode(data);
    Uri uri =
        Uri.parse('http://' + returnHost() + ':8080/walletengine/transfer');
    final response = await http.post(uri, body: body, headers: headers);
    await fetchData(_user.userLoginId);
    notifyListeners();
    return response.body;
  }
}

dynamic returnHost() {
  if (Platform.isAndroid) {
    return "10.0.2.2";
  } else {
    return "localhost";
  }
}
