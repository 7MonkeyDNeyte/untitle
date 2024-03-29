import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealth/Page/recherche/result_search_screen.dart';

import '../../utils/constant.dart';
import '../../utils/size_config.dart';
import '../homebnb.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> typeSpecialist = [
    'Generalist',
    'Dentist',
    'Psychologue',
    'Médecin',
    'Infirmière',
    'Pharmacien',
    'Chirurgien',
    'Cardiologue',
    'Ophtalmologiste',
    'Pédiatre',
    'Gynécologue',
    'Orthopédiste',
    'Neurologue',
    'Dermatologue',
    'Oncologue',
    'Radiologue',
    'Urologue',
    'Endocrinologue',
    'Hématologue',
    'Immunologue',
    'Gastro-entérologue',
    'Pneumologue',
    'Allergologue',
    'Anesthésiologue',
    'Neuropsychiatre',
    'Nutritionniste',
    'ORL',
    'Rhumatologue',
    'Toxicologue'
  ];

  TextEditingController inputDate = TextEditingController();

  TextEditingController inputHour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    builder: (BuildContext context) => const BottomNavBar()),
                (Route<dynamic> route) => route.isFirst);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Search Here',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(25),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(110)),
                child: RichText(
                  text: TextSpan(
                    text: 'Trouvez un\n',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      WidgetSpan(
                          child: SizedBox(
                        width: getProportionateScreenWidth(200),
                        height: getProportionateScreenWidth(23),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            for (String specialist in typeSpecialist)
                              FadeAnimatedText(
                                textStyle: GoogleFonts.courgette(
                                    fontSize: getProportionateScreenWidth(19),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                specialist,
                                duration: const Duration(seconds: 4),
                              ),
                          ],
                          repeatForever: true,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Entrer Quartier, Arrondissement',
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    suffixIcon: IconButton(
                      icon: const Icon(IconlyBroken.location),
                      onPressed: () {},
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Docteur, Specialiste, hopital...',
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    suffixIcon: const Icon(Icons.medical_services_outlined),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(150),
                        vertical: getProportionateScreenWidth(20)),
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultatSearch(),
                      ),
                    );
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: getProportionateScreenWidth(18)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
