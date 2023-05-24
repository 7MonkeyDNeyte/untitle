import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:untitle/Page/recherche/result_search_screen.dart';
import 'package:untitle/utils/constant.dart';
import 'package:untitle/utils/size_config.dart';

class info_practicien extends StatelessWidget {
  const info_practicien({super.key});

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
                    builder: (BuildContext context) => ResultatSearch()),
                (Route<dynamic> route) => route.isFirst);
          },
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Dr. Andela Edward',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ////////////////image//////////////////////
              Container(
                height: getProportionateScreenWidth(250),
                width: double.infinity,
                color: Colors.amber,
                child: Image.asset('assets/image/Ordonnance.jpg'),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),

              ///////////// button////////////////////
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: kPrimaryColor,
                    fixedSize: Size(
                      getProportionateScreenWidth(300),
                      getProportionateScreenHeight(50),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Prise de rendez-vous effectuée'),
                      backgroundColor: const Color.fromARGB(255, 40, 150, 206),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 6,
                      duration: const Duration(seconds: 4),
                      action: SnackBarAction(
                        label: 'Annuler',
                        onPressed: () {},
                        textColor: Colors.white,
                      ),
                    ),
                  );
                },
                child: const Text('Prendre rendez-vous'),
              ),
              /////////////////////////////////////////
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              ////////////////////premier container///////////////////////////
              Container(
                width: getProportionateScreenWidth(350),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        color: Color.fromARGB(204, 145, 144, 144),
                        offset: Offset(3, 5),
                      ),
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                    ////////////////element row///////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: getProportionateScreenWidth(25),
                          color: Colors.grey[700],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '14 Rue Elypse',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                            Text(
                              '92300 Ouenze',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(Icons.add)
                      ],
                    ),
                    /////////////////////////////////////////
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      indent: 80,
                      endIndent: 80,
                    ),
                    ////////////////////Tarif/////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.euro,
                          size: getProportionateScreenWidth(24),
                          color: Colors.grey[700],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'Tarifs',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Carte Vitale acceptée',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(Icons.add)
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      indent: 80,
                      endIndent: 80,
                    ),

                    /////////////////Moyen paiement///////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          size: getProportionateScreenWidth(24),
                          color: Colors.grey[700],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: getProportionateScreenWidth(10),
                            ),
                            Text(
                              'Moyens de paiement',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(12),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Chèques, espèces et cartes bancaires',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                  ],
                ),
              ),
              /////////fin premier container//////////////////
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),

              /////////////////second container
              Container(
                height: 150,
                width: getProportionateScreenWidth(350),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        color: Color.fromARGB(255, 145, 144, 144),
                        offset: Offset(3, 5),
                      ),
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.text_snippet,
                          size: getProportionateScreenWidth(23),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Presentation',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(8),
                            )
                          ],
                        ), ///////////////////
                        const SizedBox(
                          width: 30,
                        ),
                        //////////////////////
                        const Icon(Icons.add),
                        //////////////////////
                      ],
                    ),
                    ////////////////////////
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      indent: 80,
                      endIndent: 80,
                    ),
                    ///////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.av_timer_rounded,
                          size: getProportionateScreenWidth(24),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Horaires',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(8),
                            )
                          ],
                        ), ///////////////////
                        const SizedBox(
                          width: 30,
                        ),
                        //////////////////////
                        const Icon(Icons.add),
                        //////////////////////
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 10,
                      indent: 80,
                      endIndent: 80,
                    ),
                    ///////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.grading,
                          size: getProportionateScreenWidth(24),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Formations',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: getProportionateScreenWidth(8),
                            )
                          ],
                        ), ///////////////////
                        const SizedBox(
                          width: 30,
                        ),
                        //////////////////////
                        const Icon(Icons.add),
                        //////////////////////
                      ],
                    ),
                  ],
                ),
              ),
              ////////////////////fin second container/////////////////////
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
