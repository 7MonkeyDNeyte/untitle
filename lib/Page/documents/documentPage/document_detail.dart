import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';
import '../model/model.dart';

class DocumentDetail extends StatelessWidget {
  final Doc doc;
  const DocumentDetail({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doc.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  doc.type,
                  style: const TextStyle(
                      fontSize: 17, fontStyle: FontStyle.italic),
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: getProportionateScreenWidth(400),
                        color: Colors.grey[600],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: getProportionateScreenWidth(30),
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
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
