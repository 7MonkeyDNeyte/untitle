import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitle/utils/constant.dart';
import 'package:untitle/utils/size_config.dart';

import '../Login/login.dart';

class Logup_screen extends StatefulWidget {
  const Logup_screen({super.key});

  @override
  State<Logup_screen> createState() => _Logup_screenState();
}

class _Logup_screenState extends State<Logup_screen> {
  bool checkValue = false;
  bool register = true;
  List textfieldsStrings = [
    "", //firstName
    "", //lastName
    "", //email
    "", //password
    "", //confirmPassword
  ];

  final _firstnamekey = GlobalKey<FormState>();
  final _lastnamekey = GlobalKey<FormState>();
  final _emailkey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.02,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              'Hey there,',
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.015,
                ),
                child: Text(
                  'Create an Account',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.015,
                ),
                child: buildTextField(
                  "First name",
                  IconlyBroken.profile,
                  false,
                  size,
                  (valuesurname) {
                    if (valuesurname.length <= 1) {
                      buildSnackError(
                        'Invalid name',
                        context,
                        size,
                      );
                      return '';
                    }
                    return null;
                  },
                  _firstnamekey,
                  0,
                  isDarkMode,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.015,
                ),
                child: buildTextField(
                  "Last name",
                  IconlyBroken.profile,
                  false,
                  size,
                  (valuesurname) {
                    if (valuesurname.length <= 1) {
                      buildSnackError(
                        'Invalid name',
                        context,
                        size,
                      );
                      return '';
                    }
                    return null;
                  },
                  _lastnamekey,
                  1,
                  isDarkMode,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Form(
                child: buildTextField(
                  'Email',
                  IconlyBroken.message,
                  false,
                  size,
                  (valuemail) {
                    if (valuemail.length < 5) {
                      buildSnackError(
                        'Invalid email',
                        context,
                        size,
                      );
                      return '';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                        .hasMatch(valuemail)) {
                      buildSnackError(
                        'Invalid email',
                        context,
                        size,
                      );
                      return '';
                    }
                    return null;
                  },
                  _emailkey,
                  2,
                  isDarkMode,
                ),
              ),
              Form(
                child: buildTextField(
                  'Password',
                  IconlyBroken.lock,
                  true,
                  size,
                  (valuepassword) {
                    if (valuepassword.length < 6) {
                      buildSnackError(
                        'Invalid password',
                        context,
                        size,
                      );
                      return '';
                    }
                    return null;
                  },
                  _passwordKey,
                  3,
                  isDarkMode,
                ),
              ),
              Form(
                child: buildTextField(
                  'Confirm password',
                  IconlyBroken.lock,
                  true,
                  size,
                  (valuepassword) {
                    if (valuepassword != textfieldsStrings[3]) {
                      buildSnackError(
                        'Passwords must match',
                        context,
                        size,
                      );
                      return '';
                    }
                    return null;
                  },
                  _confirmPasswordkey,
                  4,
                  isDarkMode,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.015,
                  vertical: size.height * 0.025,
                ),
                child: CheckboxListTile(
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By creating an account, you agree to our ",
                          style: GoogleFonts.poppins(
                            color: Colors.grey[700],
                            fontSize: size.height * 0.015,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              print('Conditions of Use');
                            },
                            child: Text(
                              'Conditions of Use',
                              style: GoogleFonts.poppins(
                                color: kPrimaryColor,
                                decoration: TextDecoration.underline,
                                fontSize: size.height * 0.015,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: GoogleFonts.poppins(
                            color: Colors.grey[700],
                            fontSize: size.height * 0.015,
                          ),
                        ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              print(' Privacy Notice');
                              // Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => const NewMail()),
                              //       );
                            },
                            child: Text(
                              "Privacy Notice",
                              style: GoogleFonts.poppins(
                                color: kPrimaryColor,
                                decoration: TextDecoration.underline,
                                fontSize: size.height * 0.016,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  activeColor: Colors.grey[650],
                  value: checkValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkValue = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(top: size.height * 0.085),
                child: SizedBox(
                  width: size.width * 0.9,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_firstnamekey.currentState!.validate()) {
                        if (_lastnamekey.currentState!.validate()) {
                          if (_emailkey.currentState!.validate()) {
                            if (_passwordKey.currentState!.validate()) {
                              if (_confirmPasswordkey.currentState!
                                  .validate()) {
                                if (checkValue == false) {
                                  buildSnackError(
                                      'Accept our Privacy Policy and Term Of Use',
                                      context,
                                      size);
                                } else {
                                  print('register');
                                }
                              }
                            }
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26))),
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.031,
                      ),
                    ),
                  ),
                ),
                //   ButtonWidget(
                //   text: 'Register',
                //   backColor: [Color(0xff92A3FD), Color(0xff9DCEFF)],
                //   textColor: [
                //     Colors.white,
                //     Colors.white,
                //   ],
                //   onPressed: () {}
                // ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: size.height * 0.018,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.poppins(
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool toggleVisible = false;
  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            style:
                TextStyle(color: isDarkMode ? Colors.grey[800] : Colors.black),
            onChanged: (value) {
              setState(() {
                textfieldsStrings[stringToEdit] = value;
              });
            },
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !toggleVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.012,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: Colors.grey[800],
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            toggleVisible = !toggleVisible;
                          });
                        },
                        child: toggleVisible
                            ? const Icon(
                                IconlyBroken.show,
                                color: Color(0xff7B6F72),
                              )
                            : const Icon(
                                IconlyBroken.hide,
                                color: Color(0xff7B6F72),
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
