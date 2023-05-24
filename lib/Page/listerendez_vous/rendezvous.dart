import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:untitle/Page/listerendez_vous/rdv_a_venir/rdv_a_venir.dart';
import 'package:untitle/Page/listerendez_vous/rdv_passe/passe.dart';

import '../../utils/constant.dart';
import '../recherche/search_screen.dart';

class RendezvousScreen extends StatelessWidget {
  const RendezvousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          title: Text(
            'Mes rendez-vous',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: const Column(
          children: [
            TabBar(
              dividerColor: Colors.blue,
              indicatorColor: kPrimaryColor,
              labelColor: kPrimaryColor,
              indicatorWeight: 3,
              automaticIndicatorColorAdjustment: true,
              labelStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  child: Text("A venir"),
                ),
                Tab(
                  child: Text("Passées"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Rdv_Futur(),
                    Rdv_passe(),
                  ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(IconlyLight.search),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ));
          },
          label: const Text("Prendre rendez-vous"),
          elevation: 13,
        ),
      ),
    );
  }
}
