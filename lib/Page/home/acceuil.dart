import 'package:flutter/material.dart';
import 'package:untitle/Page/documents/NotePage/notePage.dart';
import 'package:untitle/utils/constant.dart';

import '../documents/documentPage/documentpage.dart';

class AcceuilScreen extends StatelessWidget {
  const AcceuilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Mes documents',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                TabBar(
                  indicatorColor: kPrimaryColor,
                  labelColor: kPrimaryColor,
                  indicatorWeight: 3,
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Tab(
                      text: 'Document',
                    ),
                    Tab(
                      text: 'Note',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
