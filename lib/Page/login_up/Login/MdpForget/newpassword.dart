import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../utils/size_config.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formfield = GlobalKey<FormState>();
  bool obscuretext = true;
  bool passToggle = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Add these variables to hold error messages
  String passwordErrorText = '';
  String confirmPasswordErrorText = '';

  // Define a regular expression to match password requirements
  RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[!@#$&*~%^()_+=-])[a-zA-Z0-9!@#$&*~%^()_+=-]{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft2),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formfield,
            child: Column(children: [
              Text(
                'Create new password',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your new password must be different\n from previous used passwords.',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Password',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: getProportionateScreenWidth(300),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    } else if (!value
                        .contains(RegExp('[!@#%^&*(),.?":{}|<>]'))) {
                      return 'Password must contain at least one special character';
                    } else if (!value.contains(RegExp('[A-Z]'))) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  obscureText: obscuretext,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscuretext = !obscuretext;
                          });
                        },
                        child: Icon(obscuretext
                            ? IconlyBroken.hide
                            : Icons.visibility_outlined)),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintStyle: const TextStyle(
                      height: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Confirm Password'),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: getProportionateScreenWidth(300),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else if (!passwordRegex.hasMatch(value)) {
                      return 'Password must contain at least one special character and one uppercase letter';
                    } else {
                      return null;
                    }
                  },
                  obscureText: passToggle,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? IconlyBroken.hide
                            : Icons.visibility_outlined)),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintStyle: const TextStyle(
                      height: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
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
                      fixedSize: const Size(200, 50),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const Home(),
                      //     ));
                    },
                    child: const Text("Send Instructions"),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
