// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpay/p2p/screens/scan_QR.dart';
import '../../login/providers/login_user_provider.dart';
import '../providers/search_user_list_provider.dart';
import 'enter_amount.dart';

// CREATING A STATEFUL WIDGET HERE
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  int c = 0;
  @override
  Widget build(BuildContext context) {
    final uname =
        Provider.of<LoginUserProvider>(context, listen: false).user.userLoginId;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Autocomplete<User>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  for (int i = 0; i < li.length; i++) {
                    if (li[i].name == uname.toString()) {
                      li.remove(li[i]);
                    }
                  }
                  return li
                      .where((User user) => user.name
                          .toLowerCase()
                          .startsWith(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                displayStringForOption: (User option) => option.name,
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    onChanged: (query) async {
                      await getUserfromQuery(query.toString(), uname);
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      labelText: 'Search for User',
                      hintText: 'Enter User Name / Rakuten Pay ID',
                    ),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                },
                onSelected: (User selection) {
                  receiverName = selection.name;
                  receiverUid = selection.userLoginId;
                },
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected<User> onSelected,
                    Iterable<User> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      child: Container(
                        child: Scrollbar(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final User option = options.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  onSelected(option);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EnterAmount()),
                                  );
                                },
                                child: ListTile(
                                  title: Text(option.name,
                                      style:
                                          const TextStyle(color: Colors.black)),
                                ),
                              );
                            },
                          ),
                          isAlwaysShown: false,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            heroTag: "hero8",
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScanQrPage()));
            },
            icon: const Icon(Icons.qr_code_2),
            label: const Text("Pay using QR"),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
