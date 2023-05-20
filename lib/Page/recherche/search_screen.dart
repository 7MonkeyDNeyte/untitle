import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitle/Page/recherche/result_search_screen.dart';

import '../../utils/constant.dart';
import '../../utils/size_config.dart';
import '../homebnb.dart';

import 'package:intl/intl.dart' show DateFormat;

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
                    style: TextStyle(
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
                    suffixIcon: Icon(Icons.medical_services_outlined),
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
                  controller: inputDate,
                  minLines: 1,
                  focusNode: FocusNode(canRequestFocus: false),
                  autofocus: false,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Selectionnez date',
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    suffixIcon: Icon(IconlyBroken.calendar),
                    border: InputBorder.none,
                  ),
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                  primary: kPrimaryColor,
                                  onPrimary: Colors.white,
                                  onSurface: Colors.black)),
                          child: child!,
                        );
                      },
                    );
                    if (pickeddate != null) {
                      setState(() {
                        inputDate.text =
                            DateFormat("dd/MM/yyyy").format(pickeddate);
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: TextField(
                  focusNode: FocusNode(canRequestFocus: false),
                  controller: inputHour,
                  minLines: 1,
                  autofocus: false,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Selectionnez l\'heure',
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    suffixIcon: const Icon(IconlyBroken.timeCircle),
                    border: InputBorder.none,
                  ),
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                            primary: kPrimaryColor,
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                            background: Colors.lightBlue,
                          )),
                          child: child!,
                        );
                      },
                    );
                    if (time != null) {
                      setState(() {
                        inputHour.text = time.format(context).toLowerCase();
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(150),
                        vertical: getProportionateScreenWidth(10)),
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
