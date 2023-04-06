import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitle/utils/size_config.dart';

import 'newpassword.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({super.key});

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(50),
              ),
              SvgPicture.asset(
                'assets/checkmail.svg',
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: getProportionateScreenWidth(50),
              ),
              Text(
                'Check your mail',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(25),
                    color: Colors.black),
              ),
              SizedBox(
                height: getProportionateScreenWidth(25),
              ),
              const Text(
                  'We have send a password recover \ninstructions to your email.'),
              SizedBox(
                height: getProportionateScreenWidth(25),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPassword(),
                    ),
                  );
                },
                child: Text("Reset Password"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  fixedSize: const Size(180, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(25),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Skip, I'll confirm later",
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(50),
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Did not receive the email? Check your spam filter,\nor ",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: getProportionateScreenWidth(13),
                        ),
                      ),
                      TextSpan(
                        text: 'send again',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
