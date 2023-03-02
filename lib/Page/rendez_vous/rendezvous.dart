import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:untitle/Page/rendez_vous/rdv_a_venir/rdv_a_venir.dart';
import 'package:untitle/Page/rendez_vous/rdv_passe/passe.dart';

import '../../utils/constant.dart';

class RendezvousScreen extends StatelessWidget {
  const RendezvousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Mes rendez-vous',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const TabBar(
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
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Rdv_Futur(),
                    Rdv_passe(),
                  ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(IconlyLight.search),
          onPressed: () {},
          label: const Text("Prendre rendez-vous"),
          elevation: 13,
        ),
      ),
    );
  }
}
