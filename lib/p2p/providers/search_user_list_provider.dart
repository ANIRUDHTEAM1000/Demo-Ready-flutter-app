import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../login/providers/login_user_provider.dart';

class User {
  late String name;
  late String userLoginId;
  User(this.name, this.userLoginId);
}

List<User> li = [];
late String receiverName;
late String receiverUid;

dynamic getUserfromQuery(String query, String uname) async {
  var url = "" + returnHost() + ":8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/query/" + query));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    var u = jsonResponse['users'];
    li.clear();
    if (query == "") {
      return;
    }
    for (int i = 0; i < u.length; i++) {
      User obj = User(u[i]["name"], u[i]["user_login_id"]);
      if (u[i]["name"] != uname) {
        li.add(obj);
      }
    }
  }
}
