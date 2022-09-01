import 'package:flutter/material.dart';

void snackBarMessage(context, String text, bool success) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize:  20,fontWeight:FontWeight.w600,color: Color.fromRGBO(24, 49, 79, 1),),
        ),
      ],
    ),
    duration: const Duration(milliseconds: 3000),
    backgroundColor: success ? const Color.fromRGBO(240, 244, 250, 1) : Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
  ));
}
