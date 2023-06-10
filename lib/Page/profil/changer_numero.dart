import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealth/utils/constant.dart';
import 'package:myhealth/utils/size_config.dart';

import 'modifier_profil.dart';

class ChangerNumero extends StatefulWidget {
  const ChangerNumero({super.key});

  @override
  State<ChangerNumero> createState() => _ChangerNumeroState();
}

class _ChangerNumeroState extends State<ChangerNumero> {
  late final TextEditingController controller;

  bool isButtonEnable() {
    controller = numberController!;
    return controller.text.isNotEmpty;
  }

  TextEditingController? numberController;

  @override
  void initState() {
    super.initState();
    numberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft2),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const ModifierProfil()),
                (Route<dynamic> route) => route.isFirst);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Retour',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: getProportionateScreenWidth(15),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        widthFactor: double.infinity,
        child: Column(
          children: [
            Text(
              'Nouveau numéro',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(23),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            Text(
              'Votre nouveau numéro recevra un\ncode de configuration par appel ou\nSMS.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(16)),
            ),
            SizedBox(
              height: getProportionateScreenWidth(100),
            ),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Form(
                child: TextFormField(
                  controller: numberController,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(15)),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixText: '+242  ',
                      prefixStyle: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(15)),
                      hintText: '00 000 00 00',
                      hintStyle: GoogleFonts.poppins()),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                elevation: 0,
                fixedSize: Size(
                  getProportionateScreenWidth(310),
                  getProportionateScreenWidth(40),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: isButtonEnable()
                  ? () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          alignment: Alignment.center,
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Modifier',
                                style: GoogleFonts.poppins(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(12)),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.removeRoute(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const ModifierProfil()),
                                );
                              },
                              child: Text(
                                'Continuer',
                                style: GoogleFonts.poppins(
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                          title: Text(
                            '+242 06 683 2650',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(23)),
                          ),
                          content: Text(
                            'Est-ce bon le numéro ?',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: getProportionateScreenWidth(13)),
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          titlePadding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenWidth(3)),
                        ),
                      );
                    }
                  : null,
              child: Text(
                'Continuer',
                style: GoogleFonts.poppins(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            )
          ],
        ),
      ),
    );
  }
}
