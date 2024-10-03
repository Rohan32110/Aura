import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const kLocationScrnColor = Color(0xFF668EA3);
const kLoadingScrnColor = Color(0xFF49BAFB);
const kBrownTextColor = Color(0xFF4E4E4E);

const kMargin = EdgeInsets.only(left: 7, right: 7.0, bottom: 7.0);
const kPadding = EdgeInsets.only(left: 7, right: 7.0, top: 3.0, bottom: 3.0);

const kContainerMargin = EdgeInsets.all(6.0);
const kBorderRadius = 10.0;

const kAuraTextStyle = TextStyle(
  fontSize: 21,
  color: Colors.white,
  fontFamily: 'Ubuntu',
);

const kTempStyle = TextStyle(
  fontSize: 49,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontFamily: 'Roboto',
);

Decoration kBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
    colors: [
      Colors.white.withOpacity(.3),
      Colors.white.withOpacity(.1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

const kUnderTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: Colors.white,
  fontFamily: 'Ubuntu',
);

const kInfoTextStyle = TextStyle(
  color: Color(0xFF4E4E4E),
  fontSize: 16,
  fontWeight: FontWeight.bold,
  fontFamily: 'Ubuntu',
);

const kInputDecoration = InputDecoration(
  border: InputBorder.none,
  prefixIcon: Icon(Icons.search),
  hintText: "Enter city name",
  hintStyle: TextStyle(
    color: Color(0xFF555555),
  ),
);

var kButtonStyle = ButtonStyle(
  elevation: WidgetStatePropertyAll(0.0),
  padding: const WidgetStatePropertyAll(
    EdgeInsets.only(top: 1.0, bottom: 1.0, left: 15, right: 15),
  ),
  backgroundColor: const WidgetStatePropertyAll(kLoadingScrnColor),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
  ),
);

const kAlertStyle = AlertStyle(
  backgroundColor: kLoadingScrnColor,
  titleTextAlign: TextAlign.center,
  titleStyle: TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Ubuntu',
  ),
  descStyle: TextStyle(
    color: Colors.white,
    fontSize: 18,
  ),
);
