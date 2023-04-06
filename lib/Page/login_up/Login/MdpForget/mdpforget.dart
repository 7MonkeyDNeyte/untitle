import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:untitle/Page/Onboarding/component/default_button.dart';
import 'package:untitle/utils/size_config.dart';

import '../../../../utils/constant.dart';
import '../login.dart';
import 'Check.dart';

class NewMail extends StatefulWidget {
  const NewMail({super.key});

  @override
  State<NewMail> createState() => _NewMailState();
}

class _NewMailState extends State<NewMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconlyBroken.arrowLeft2),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(15),
                ),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(15),
                ),
                child: Text(
                  "Enter the email associated with your account \nand we'll send an email with instructions \nto reset your password.",
                  style: TextStyle(color: Colors.grey[800], fontSize: 15),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(50),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(60),
                ),
                child: Text(
                  "Email address",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(50),
                ),
                child: Container(
                  width: getProportionateScreenWidth(500),
                  height: getProportionateScreenWidth(52),
                  padding: const EdgeInsets.only(top: 3, left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ]),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: TextStyle(
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(110)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 12,
                      fixedSize: Size(200, 50),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckMail(),
                          ));
                    },
                    child: const Text("Send Instructions"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
