import 'package:flutter/material.dart';
import 'package:myhealth/utils/size_config.dart';

class Enreg_Doc extends StatelessWidget {
  const Enreg_Doc({super.key});

  @override
  Widget build(BuildContext context) {
    return const Body();
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
                const Text(
                  "Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const Text(
                  "Nom document",
                ),
                const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Nom du document',
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text("Description"),
                const TextField(
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(),
                Image.asset('assets/docteur.png'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: const Text('Continue'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('annuler'),
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
