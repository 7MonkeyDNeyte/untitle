import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealth/Page/Onboarding/component/default_button.dart';
import 'package:myhealth/utils/size_config.dart';

import '../../documents/document.dart';
import '../Logup/log_up.dart';
import 'MdpForget/mdpforget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscuretext = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String emailAd = '';
  String passwrd = '';

  // Constantes globales pour stocker les informations de l'administrateur
  static const String adminEmail = 'admin';
  static const String adminPassword = 'admin';

  // Définition de la fonction de connexion
  void login() {
    // Vérification des informations de connexion
    if (emailController.text == adminEmail &&
        passwordController.text == adminPassword) {
      // Redirection vers la page d'accueil ou autre page de votre choix
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DocumentScreen()),
      );
    } else {
      // Affichage d'un message d'erreur si les informations de connexion sont incorrectes
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Identifiants invalides'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(170),
                    ),
                    child: Text(
                      ' Welcome Back',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(210),
                    ),
                    child: const Text(
                      '   Sign in for continue',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(100),
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        hintStyle: TextStyle(
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10),
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
                  SizedBox(
                    height: getProportionateScreenWidth(1),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(150)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewMail()));
                      },
                      child: const Text(
                        "Mot de passe oublier ?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(250),
                    child: DefaultButton(
                      text: 'Connexion',
                      press: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    " - Or sign in with -",
                    style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialIconButton(
                          socialIcon: "assets/icon/apple.svg", ontap: () {}),
                      SocialIconButton(
                          ontap: () {}, socialIcon: "assets/icon/google.svg"),
                      SocialIconButton(
                          ontap: () {}, socialIcon: "assets/icon/facebook.svg"),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Logup_screen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialIconButton extends StatelessWidget {
  final ontap;
  final String socialIcon;
  const SocialIconButton({
    super.key,
    required this.ontap,
    required this.socialIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(55),
      width: getProportionateScreenWidth(55),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 18,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: InkWell(
          onTap: ontap,
          child: SvgPicture.asset(socialIcon),
        ),
      ),
    );
  }
}

class Textformfieldmodel extends StatelessWidget {
  final String hintText;
  final type;
  const Textformfieldmodel({
    super.key,
    required this.hintText,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        obscureText: true,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: const TextStyle(
            height: 1,
          ),
        ),
      ),
    );
  }
}
