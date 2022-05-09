import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:test/NavBar.dart';
// import 'package:test/appbar.dart';
// import 'package:test/main.dart';
final balance = 1000;

class TopupScreen extends StatefulWidget {
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Top Up"),
        backgroundColor: Colors.transparent
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Current balance \$",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  controller: _textEditingController,
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 24),
                  decoration: const InputDecoration(
                      label: Center(
                        child: Text("Amount"),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.transparent,
                      filled: true),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _textEditingController.clear();
                        _textEditingController.text = '10';
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text("\$10",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _textEditingController.clear();
                        _textEditingController.text = '50';
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text("\$50",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _textEditingController.clear();
                        _textEditingController.value = const TextEditingValue(text: '100');
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text("\$100",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _textEditingController.clear();
                        _textEditingController.value = const TextEditingValue(text: '500');
                      });
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text("\$500",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                    ),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
