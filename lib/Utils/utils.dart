import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils {
  static void flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: Colors.red,
          margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding:const EdgeInsets.all(15),
          duration:const Duration(seconds: 2),
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 100,
          messageColor: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          icon:const Icon(Icons.error ,size: 28,color: Colors.white,),
        )..show(context));
  }
}
