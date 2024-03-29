import 'package:flutter/material.dart';
import 'size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kTextColor2 = Colors.white;
const kPrimaryColor = Color(0xFF0077B6);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0077B6),
      Color(0xFF90E0EF),
    ]);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingSize = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

//Form Error
final RegExp emailValidatorRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "please Enter your address";

//
const transitionAnimate = 500;


///////////////
///
/// 
  Future<void> savePageVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingVisited', true);
  }

  Future<bool> getPageVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingVisited') ?? false;
  }