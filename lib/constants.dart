import 'package:flutter/material.dart';

const kGoogleApiKey = "AIzaSyDbNvTaBVRmsKVKuPkpPUfPa9IEd6enFdY";
const kDefaultAppBarImagePath = 'assets/images/birds-eye-view-2133661_1920.jpg';
const kInputTextStyle = TextStyle(
  fontSize: 24,
  fontFamily: 'Comfortaa',
);

const kListCardTextStyle = TextStyle(
  fontSize: 20,
  fontFamily: 'Comfortaa',
  color: Colors.white,
);
const kListCardSubtextStyle = TextStyle(
  fontSize: 15,
  fontFamily: 'Comfortaa',
  color: Colors.white,
);

const kStandartTextStyle = TextStyle(
  fontSize: 11,
  fontFamily: 'Comfortaa',
);
const kTextInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: Colors.white),
);

const kTitleTextStyle = TextStyle(fontFamily: 'SeaweedScript', fontSize: 32.0);
const kListTitleTextStyle = TextStyle(
  fontFamily: 'Comfortaa',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

EdgeInsets kDefaultCardInsets = const EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 20,
);

TextField kDefaultTextField = TextField(
  controller: TextEditingController(),
  style: kInputTextStyle,
  decoration: const InputDecoration(
    border: kTextInputBorder,
    enabledBorder: kTextInputBorder,
    focusedBorder: kTextInputBorder,
    contentPadding: EdgeInsets.all(10),
    hintStyle: kInputTextStyle,
  ),
  textAlign: TextAlign.center,
);

const String kLoremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
