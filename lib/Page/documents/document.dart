import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
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
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Mes documents',
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
                  child: Text("Document"),
                ),
                Tab(
                  child: Text("Note"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Doc_Page(),
                    NotePage(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
