import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rpay/cards/widgets/toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bottomSheet(context) => Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          child: const Text(
            "Your card detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: const Text(
            "Tap text to copy to clipboard",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: '1234567890123456'))
                .then((_) {
              showToast("Number is copied to clipboard");
            });
          },
          child: Container(
            child: Row(
              children: const [
                Expanded(
                    child: Text(
                  "Card number",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                )),
                Expanded(
                    child: Text(
                  "1234567890123456",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                )),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: '12/24')).then((_) {
              showToast("Number is copied to clipboard");
            });
          },
          child: Container(
            child: Row(
              children: const [
                Expanded(
                    child: Text(
                  "Expire on",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                )),
                Expanded(
                    child: Text(
                  "12/24",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                )),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: '543')).then((_) {
              showToast("Number is copied to clipboard");
            });
          },
          child: Container(
            child: Row(
              children: const [
                Expanded(
                    child: Text(
                  "Security code",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                )),
                Expanded(
                    child: Text(
                  "543",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                )),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: 'Saily Anderson')).then((_) {
              showToast("Number is copied to clipboard");
            });
          },
          child: Container(
            child: Row(
              children: const [
                Expanded(
                    child: Text(
                  "Card holder",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                )),
                Expanded(
                    child: Text(
                  "Saily Anderson",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                )),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        GestureDetector(
          child: Container(
            child: Row(
              children: [
                const Expanded(
                    child: Text(
                  "Enabled",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                )),
                Container(
                    width: 52.w,
                    height: 32.h,
                    // color: Colors.blue,
                    child: buildSwitch()),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        SizedBox(
          height: 30.h,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child: Text(
            "Renew number",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 18.sp),
          ),
        ),
      ]),
    );

bool value = true;
Widget buildSwitch() => Transform.scale(
      scale: 1.3,
      child: Switch.adaptive(
        thumbColor: MaterialStateProperty.all(Colors.white),
        trackColor: MaterialStateProperty.all(Colors.green),
        // activeColor: Colors.blueAccent,
        // activeTrackColor: Colors.blue.withOpacity(0.4),
        // inactiveThumbColor: Colors.orange,
        // inactiveTrackColor: Colors.black87,
        splashRadius: 30.r,
        value: value,
        onChanged: (v) {
          value = v;
        },
      ),
    );
