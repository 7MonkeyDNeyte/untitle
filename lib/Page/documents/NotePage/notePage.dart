import 'package:flutter/material.dart';
import 'package:untitle/utils/constant.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../component/defaultDocpage.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final items = List<String>.generate(0, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.isEmpty
          ? const emptyNote()
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final String item = items[index];
                return Dismissible(
                  key: Key(item),
                  onDismissed: (DismissDirection dir) {
                    setState(() {
                      this.items.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(dir == DismissDirection.endToStart
                            ? '$item element effacé.'
                            : '$item element liké'),
                        action: SnackBarAction(
                          label: 'Annuler',
                          onPressed: () {
                            setState(() {
                              this.items.insert(index, item);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.blue,
                    alignment: Alignment.centerLeft,
                    child: const Icon(IconlyBroken.send, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      IconlyBroken.delete,
                      color: Colors.black,
                    ),
                  ),
                  child: ListTile(
                      title: Center(
                    child: Text(items[index]),
                  )),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {setState(() {
            items.add('Item ');
          });},
        icon: const Icon(IconlyLight.paper),
        label: const Text("Créer une note"),
        elevation: 12,
      ),
    );
  }
}

class emptyNote extends StatelessWidget {
  const emptyNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          DefaultDocPage(
            svgPicture: 'assets/image/pen_note.svg',
            text1: "Créer des notes médicales",
            text2:
                "Ajoutez et gérez toutes vos notes pour garder la\n trace de vos informations de santé: Elles sont\nsécuriées grâce aux techniques de chiffrement\navancées.",
          ),
        ],
      ),
    );
  }
}
