import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitle/Page/recherche/see_more_liste.dart';

import '../../utils/size_config.dart';
import 'detail_practitien.dart';
import 'search_screen.dart';

class Resultat_Search extends StatelessWidget {
  TextEditingController inputDate = TextEditingController();

  TextEditingController inputHour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(IconlyBroken.arrowLeft2),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SearchScreen()),
                (Route<dynamic> route) => route.isFirst);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            text: 'Resultat\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(15),
            ),
            children: const [
              WidgetSpan(
                child: SizedBox(
                  child: Text(
                    'Ouenze',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyBroken.filter2),
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('All Ophtamologist',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SeeAll(),
                      ),
                    );
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => info_practicien(),
                ),
              ),
              child: Container(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenWidth(130),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(10),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(4, 8)),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            color: Colors.green,
                          ),
                          Container(
                            height: 80,
                            width: getProportionateScreenWidth(200),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dr. Andela Edward',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          getProportionateScreenWidth(14)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(10),
                                ),
                                const Text(
                                  'Cardiologist (MBBS, FCPS)',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(10),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        IconlyBroken.timeCircle,
                                        size: 14,
                                      ),
                                      Text(
                                        '12.00pm - 4.00pm',
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(12),
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                      const Icon(
                                        Icons.location_on,
                                        size: 14,
                                      ),
                                      Text(
                                        'Nkombo Hospital',
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(12),
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
