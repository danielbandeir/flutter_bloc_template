import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secretwall/src/posts/data/constants/sizes.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

void errorToast(String? message, FToast toast) {
  toast.showToast(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: k22, vertical: k12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(k22),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.check),
          const SizedBox(
            width: k12,
          ),
          Text(message ?? genericErrorMessage),
        ],
      ),
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: kTwo.toInt()),
  );
}
