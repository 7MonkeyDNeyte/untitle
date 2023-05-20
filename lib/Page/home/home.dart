import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:untitle/utils/size_config.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../utils/constant.dart';

import '../recherche/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Heading(typeSpecialist: typeSpecialist),
              SizedBox(
                height: getProportionateScreenWidth(25),
              ),
              Container(
                height: getProportionateScreenWidth(150),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Categorie',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.typeSpecialist,
  });

  final List<String> typeSpecialist;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
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
                        textStyle: TextStyle(
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
        SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                },
                icon: const Icon(
                  IconlyBroken.search,
                  color: kPrimaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(IconlyLight.heart),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
