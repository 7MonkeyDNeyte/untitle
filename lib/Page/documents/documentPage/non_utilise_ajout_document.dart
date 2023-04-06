import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:untitle/Page/documents/document.dart';
import 'package:untitle/utils/constant.dart';
import 'package:untitle/utils/size_config.dart';

class AjoutDoc extends StatefulWidget {
  const AjoutDoc({super.key});

  @override
  State<AjoutDoc> createState() => _AjoutDocState();
}

class _AjoutDocState extends State<AjoutDoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajout d'un nouveau document",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            annulation(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(13),
                ),
                Image.asset(
                  "assets/image/Ordonnance.jpg",
                  height: 400,
                  width: 300,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(10),
                ),
                const Text(
                  "Page 1 / 1",
                  style: TextStyle(
                      color: Color.fromARGB(255, 33, 39, 83),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(10),
                              elevation: 7),
                          child: const Icon(
                            Icons.add,
                            color: kPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(10),
                        ),
                        const Text(
                          "Nouvelle page",
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 39, 83),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(10),
                              elevation: 7),
                          child: const Icon(
                            IconlyBroken.delete,
                            color: kPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(10),
                        ),
                        const Text(
                          "Supprimer",
                          style: TextStyle(
                              color: Color.fromARGB(255, 33, 39, 83),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const AjoutDoc2()),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        minimumSize: Size(getProportionateScreenWidth(250), 40),
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
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

class AjoutDoc2 extends StatefulWidget {
  const AjoutDoc2({super.key});

  @override
  State<AjoutDoc2> createState() => _AjoutDoc2State();
}

class _AjoutDoc2State extends State<AjoutDoc2> {
  bool nameInputIsValid = true;
  String dropdownValue = 'Sélectionner le type de document';

  List<String> dropdownItems = [
    'Sélectionner le type de document',
    'Analyse médicale',
    'Ordonnance',
    'Imagerie médical',
    'Résultats d\'examen',
    'Certificat médical',
    'Lettre de liaison',
    'Autre'
  ];

  bool isButtonEnabled() {
    final TextEditingController controller = nameController!;
    return dropdownValue != dropdownItems.first && controller.text.isNotEmpty;
  }

  TextEditingController? nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajout d'un nouveau document",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            annulation(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Text(
                  "Nom du document",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: getProportionateScreenWidth(15),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: nameController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Nom du document",
                      hintStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      errorText:
                          nameInputIsValid ? null : '*Le nom est obligatoire!',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black)),
                    ),
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Text(
                  "Type de document",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: getProportionateScreenWidth(15),
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(60)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: dropdownItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        alignment: Alignment.center,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(15),
                ),
                Text(
                  'Patient concerné',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: getProportionateScreenWidth(15),
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Icon(
                      IconlyBroken.user2,
                      color: Colors.black,
                      size: getProportionateScreenWidth(22),
                      weight: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Malewal Dan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(300),
                ),
                ElevatedButton(
                  onPressed: isButtonEnabled()
                      ? () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const DocumentScreen()),
                              (Route<dynamic> route) => route.isFirst);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled()
                        ? kPrimaryColor
                        : Colors.grey.shade400,
                    minimumSize: Size(getProportionateScreenWidth(300), 50),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Confirmer',
                    style: TextStyle(fontSize: getProportionateScreenWidth(18)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> annulation(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text('Quitter sans sauvegarder'),
      children: [
        const Text(
          "Votre document ne sera pas\n sauvegardé.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              elevation: 6,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const DocumentScreen()),
                  (Route<dynamic> route) => route.isFirst);
            },
            child: const Text('QUITTER'),
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(65)),
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'ANNULER',
                style: TextStyle(color: Colors.black),
              )),
        )
      ],
    ),
  );
}
