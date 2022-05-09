import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../login/models/login_user.dart';
import '../../login/providers/login_user_provider.dart';

class QRPage extends StatelessWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<LoginUserProvider>(context, listen: false).user;
    return Scaffold(
      // drawer: Navbar(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        // leading: Builder(
        //   builder: (BuildContext context) {
        //     return IconButton(
        //       icon: const Icon(
        //         Icons.menu,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     );
        //   },
        // ),
        // actions: [
        // TextButton(
        //   child: Text("Cancel"),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // ],
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Center(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //      mainAxisAlignment: MainAxisAlignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data:
                  '{ "user_login_id" : "${user.userLoginId}" , "name": "${user.name}" }',
              version: QrVersions.auto,
              size: 320,
            )
          ],
        ),
      ),
    );
  }
}
