import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../utils/constant.dart';

import '../../utils/size_config.dart';
import '../../utils/text_guide.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Heading(typeSpecialist: typeSpecialist),
            const SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          top: 20,
                          bottom: 20,
                        ),
                        child: Row(
                          children: List.generate(textguide.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: GestureDetector(
                                onTap: () {},
                                child: Column(children: [
                                  Container(
                                    width: 180,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color: Colors.grey,
                                              offset: Offset(2, 4))
                                        ]),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Center(
                                        child: Text(
                                          textguide[index],
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              color: kPrimaryLightColor,
                                              height: 1),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categorie',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Trouvez un\n',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  WidgetSpan(
                      child: SizedBox(
                    width: 150,
                    height: 30,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        for (String specialist in typeSpecialist)
                          FadeAnimatedText(
                            textStyle: GoogleFonts.poppins(
                                fontSize: 18,
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
                            builder: (context) => const SearchScreen(),
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
        ),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icon/tooth.png", "texte": "Dentiste"},
      {"icon": "assets/icon/eye.png", "texte": "Dentiste"},
      {"icon": "assets/icon/chiropractic.png", "texte": "Dentiste"},
      {"icon": "assets/icon/gynecologist.png", "texte": "Dentiste"},
      {"icon": "assets/icon/pregnant.png", "texte": "Dentiste"},
      {"icon": "assets/icon/lungs_.png", "texte": "Dentiste"},
      {"icon": "assets/icon/testing.png", "texte": "Dentiste"},
    ];
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              categories.length,
              (index) => CategorieCard(
                icon: categories[index]["icon"],
                text: categories[index]["texte"],
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorieCard extends StatelessWidget {
  const CategorieCard({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
          width: getProportionateScreenWidth(55),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.all(
                    getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(icon, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: getProportionateScreenWidth(10),
                    fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
