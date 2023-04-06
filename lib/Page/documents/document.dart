import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constant.dart';
import 'NotePage/notePage.dart';
import 'documentPage/documentpage.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // flexibleSpace: ClipRRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: Container(
          //       color: Colors.transparent,
          //     ),
          //   ),
          // ),
          backgroundColor: kPrimaryColor,
          title: Text(
            'Mes documents',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(
              dividerColor: Colors.blue,
              indicatorColor: kPrimaryColor,
              labelColor: kPrimaryColor,
              indicatorWeight: 3,
              automaticIndicatorColorAdjustment: true,
              labelStyle: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  child: Text("Document"),
                ),
                Tab(
                  child: Text("Note"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    DocPage(),
                    NotePage(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
