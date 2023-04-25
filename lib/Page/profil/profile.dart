import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitle/utils/constant.dart';
import 'package:untitle/utils/size_config.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:iconly/iconly.dart';

import '../login_up/Login/login.dart';
import 'modifier_profil.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  bool _switchvalue = false;
  bool _switchval = false;
  bool connect = false;

  late Colors logoConColors;
  late IconData icone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarOpacity: 0.1,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ModifierProfil(),
                ),
              );
            },
            child: Text(
              'Modifier',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200]
      //_switchvalue && !_switchval ? Colors.black87 : Colors.white
      ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(115),
                ),
                child: Icon(
                  color: Colors.grey[600],
                  Icons.account_circle_rounded,
                  size: getProportionateScreenWidth(150),
                ),
              ),
              Text(
                'Nate Malewal',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(15)),
              ),
              const Text(
                '+242 06 683 2650',
                style: TextStyle(color: Colors.black),
              ),
              Divider(
                color: Colors.black,
                height: getProportionateScreenWidth(10),
                indent: getProportionateScreenWidth(50),
                endIndent: getProportionateScreenWidth(50),
              ),
              const SizedBox(
                height: 20,
              ),
/////////////////////////////////////////////
              Container(
                width: getProportionateScreenWidth(330),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: ListTile(
                  leading: Container(
                    height: getProportionateScreenWidth(27),
                    width: getProportionateScreenWidth(27),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Icon(
                      IconlyBroken.logout,
                      color: Colors.white,
                      size: getProportionateScreenWidth(20),
                    ),
                  ),
                  title: Text(
                    'Se Deconnecter',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Icon(
                    IconlyBroken.arrow_right_2,
                    color: Colors.grey[700],
                  ),
                  onTap: () {},
                  hoverColor: Colors.grey,
                  autofocus: false,
                  enableFeedback: true,
                  focusColor: Colors.blueGrey,
                ),
              ),
              //////////////////////////////////////////
              const SizedBox(
                height: 20,
              ),

              //////////////1er Container///////////////////////
              Container(
                width: getProportionateScreenWidth(330),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    ElementContainer(
                      couleur: kPrimaryColor,
                      icone: Icons.key,
                      libelle: 'Compte',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.red,
                      icone: IconlyBold.notification,
                      libelle: 'Notifications et sons',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.grey,
                      icone: IconlyBold.lock,
                      libelle: 'Confidentialité et sécurité',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.blueAccent,
                      icone: Icons.brightness_2_rounded,
                      libelle: 'Notifications et sons',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.orange,
                      icone: Icons.energy_savings_leaf,
                      libelle: 'Economie d\'energie',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.purple,
                      icone: Icons.language,
                      libelle: 'Langue',
                      press: () {},
                    ),
                  ],
                ),
              ),
              /////////////////////////////////
              const SizedBox(
                height: 20,
              ),

              //////////2eme Container//////////////////
              Container(
                width: getProportionateScreenWidth(330),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElementContainer(
                      couleur: Colors.green,
                      icone: Icons.help,
                      libelle: 'Aide',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.orange,
                      icone: IconlyBold.chat,
                      libelle: 'Poser une question',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.yellow,
                      icone: IconlyBold.info_circle,
                      libelle: 'FAQ MyHealth',
                      press: () {},
                    ),
                    Divider(
                      color: Colors.black,
                      height: getProportionateScreenWidth(10),
                      indent: getProportionateScreenWidth(50),
                      endIndent: getProportionateScreenWidth(50),
                    ),
                    ElementContainer(
                      couleur: Colors.red,
                      icone: IconlyBold.heart,
                      libelle: 'Inviter un contact',
                      press: () {},
                    ),
                  ],
                ),
              ),

              //////////////////////////////////////////////
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),

              /////////////////version///////////////////////
              Text(
                'Version 2.23.5.78',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
              //////////////////////////////////////
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ElementContainer extends StatelessWidget {
  final Color couleur;
  final String libelle;
  final IconData icone;
  const ElementContainer({
    super.key,
    required this.libelle,
    required this.icone,
    required this.couleur,
    required this.press,
  });
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: getProportionateScreenWidth(27),
        width: getProportionateScreenWidth(27),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: couleur,
        ),
        child: Icon(
          icone,
          color: Colors.white,
          size: getProportionateScreenWidth(20),
        ),
      ),
      title: Text(
        libelle,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        IconlyBroken.arrow_right_2,
        color: Colors.grey[700],
      ),
      onTap: press,
      hoverColor: Colors.grey,
      autofocus: false,
      enableFeedback: true,
      focusColor: Colors.blueGrey,
    );
  }
}

class DividerWiget extends StatelessWidget {
  const DividerWiget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 12,
      color: Colors.black,
      indent: getProportionateScreenWidth(35),
      endIndent: getProportionateScreenWidth(35),
    );
  }
}

class WidgetElement extends StatelessWidget {
  const WidgetElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        menuModel(
          icon: Icons.brightness_2_sharp,
          text: 'Apparence',
        ),
        Icon(IconlyBroken.arrow_right_2),
      ],
    );
  }
}

class menuModel extends StatelessWidget {
  final IconData icon;
  final String text;
  const menuModel({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: getProportionateScreenWidth(14),
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
// Center(
//   child: AnimatedTextKit(animatedTexts: [
//     TyperAnimatedText('MyHealth',
//         speed: Duration(seconds: 0),
//         textStyle: GoogleFonts.courgette(
//           fontSize: 50,
//           fontWeight: FontWeight.bold,
//         ),
//         curve: Curves.linear),
//   ], repeatForever: true),
// ),

// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Text(
//       "Mode automatique",
//       style: GoogleFonts.poppins(
//           color: _switchvalue && !_switchval
//               ? Colors.white
//               : Colors.black,
//           fontSize: getProportionateScreenWidth(12)),
//     ),
//     Switch(
//         thumbIcon:
//             MaterialStatePropertyAll(Icon(Icons.ac_unit)),
//         activeColor: Colors.white,
//         activeTrackColor: kPrimaryColor,
//         inactiveThumbColor: Colors.white,
//         value: this._switchval,
//         onChanged: (bool val) {
//           setState(() {
//             this._switchval = val;
//           });
//         }),
//     Divider(height: 20),
//   ],
// ),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: [
//     Text(
//       "Mode Sombre",
//       style: GoogleFonts.poppins(
//           color: _switchvalue && !_switchval
//               ? Colors.white
//               : Colors.black,
//           fontSize: getProportionateScreenWidth(15)),
//     ),
//     Switch(
//         thumbIcon:
//             MaterialStatePropertyAll(Icon(Icons.ac_unit)),
//         activeColor: Colors.white,
//         activeTrackColor: kPrimaryColor,
//         inactiveThumbColor: Colors.white,
//         value: _switchval ? false : this._switchvalue,
//         onChanged: _switchval
//             ? null
//             : (bool value) {
//                 setState(() {
//                   this._switchvalue = value;
//                 });
//               }),
//   ],
// ),

class Apparence extends StatefulWidget {
  const Apparence({super.key});

  @override
  State<Apparence> createState() => _ApparenceState();
}

class _ApparenceState extends State<Apparence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
