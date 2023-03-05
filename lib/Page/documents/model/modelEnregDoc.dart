import 'package:flutter/material.dart';
import 'package:untitle/utils/size_config.dart';

class Enreg_Doc extends StatelessWidget {
  const Enreg_Doc({super.key});

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(50),
                ),
                Text(
                  "Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "Nom document",
                ),
                TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Nom du document',
                    )),
                SizedBox(
                  height: 10,
                ),
                Text("Description"),
                TextField(
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(),
                Image.asset('assets/docteur.png'),

                
                SizedBox(
                  height: 10,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Continue'),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('annuler'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
