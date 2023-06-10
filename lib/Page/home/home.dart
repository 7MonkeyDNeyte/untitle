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
            Column(
              children: [],
            )
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
    return Row(
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
    );
  }
}
