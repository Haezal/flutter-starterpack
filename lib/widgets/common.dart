import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';

MaterialButton longButtons(String title, VoidCallback fun, {Color color: MyColor.um_blue, Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

label(String title) => Text(title);

InputDecoration buildInputDecorationWithIcon(
  String labelText,
  String hintText,
  IconData icon,
) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    hintText: hintText,
    labelText: labelText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
  );
}

InputDecoration buildInputDecorationWithIconAndSuffix(
  String labelText,
  String hintText,
  IconData icon,
  Widget suffixIcon,
) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    hintText: hintText,
    labelText: labelText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    suffixIcon: suffixIcon,
  );
}

InputDecoration buildInputDecoration(
  String labelText,
  String hintText,
) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
  );
}

Flushbar flushbar(String titleText, String bodyText) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    // backgroundColor: Colors.green,
    boxShadows: [BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
    backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
    isDismissible: false,
    duration: Duration(seconds: 3),
    // icon: Icon(
    //   Icons.cancel_outlined,
    //   color: Colors.white,
    // ),
    showProgressIndicator: false,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
      titleText,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    messageText: Text(
      bodyText,
      style: TextStyle(color: Colors.white),
    ),
  );
}

Flushbar successFlushbar(String titleText, String bodyText) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.green,
    boxShadows: [BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
    // backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
    isDismissible: false,
    duration: Duration(seconds: 3),
    icon: Icon(
      Icons.check_circle,
      color: Colors.white,
    ),
    showProgressIndicator: false,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
      titleText,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    messageText: Text(
      bodyText,
      style: TextStyle(color: Colors.white),
    ),
  );
}

Flushbar errorFlushbar(String titleText, String bodyText) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.red,
    boxShadows: [BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
    // backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
    isDismissible: true,
    duration: Duration(seconds: 3),
    // icon: Icon(
    //   Icons.cancel_outlined,
    //   color: Colors.white,
    // ),
    showProgressIndicator: false,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
      titleText,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
    messageText: Text(
      bodyText,
      style: TextStyle(color: Colors.white),
    ),
  );
}
