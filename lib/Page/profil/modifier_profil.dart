import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealth/utils/constant.dart';
import 'package:myhealth/utils/size_config.dart';

import '../login_up/Login/login.dart';
import 'changer_numero.dart';

class ModifierProfil extends StatefulWidget {
  const ModifierProfil({super.key});

  @override
  State<ModifierProfil> createState() => _ModifierProfilState();
}

class _ModifierProfilState extends State<ModifierProfil> {
///////////////////////////////////////////////////////
  Widget _buildBorderlessTextField() {
    return const TextField(
      maxLines: 1,
      decoration: InputDecoration.collapsed(hintText: 'name'),
    );
  }

///////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarOpacity: 0.1,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () {},
          child: Text(
            'Annuler',
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leadingWidth: getProportionateScreenWidth(80),
        actions: [
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
              'Modifier',
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
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
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  enableFeedback: true,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  'Definir une photo de profil',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(330),
                height: getProportionateScreenWidth(90),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(5),
                          horizontal: getProportionateScreenWidth(10)),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenWidth(17),
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'firstname',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: getProportionateScreenWidth(17),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      indent: 50,
                      endIndent: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(5),
                          horizontal: getProportionateScreenWidth(10)),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: getProportionateScreenWidth(15),
                        ),
                        decoration: InputDecoration.collapsed(
                            hintText: 'name',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: getProportionateScreenWidth(17),
                            ),
                            fillColor: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Entrez votre prenom et nom puis ajoutez une photo.',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              Container(
                width: getProportionateScreenWidth(330),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: ListTile(
                  leading: Text(
                    'Changer votre numero',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Text(
                    '+242 06 683 2650',
                    style: GoogleFonts.poppins(
                      color: Colors.grey[800],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangerNumero(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(8),
              ),
              Text(
                'Entrez votre numero',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(50),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    fixedSize: Size(
                      getProportionateScreenWidth(330),
                      getProportionateScreenWidth(40),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {},
                child: Text(
                  'Déconnexion',
                  style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
