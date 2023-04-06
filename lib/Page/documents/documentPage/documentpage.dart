import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constant.dart';
import '../../../utils/size_config.dart';
import '../../component/defaultdocpage.dart';
import '../../homebnb.dart';
import '../document.dart';
import '../model/model.dart';

class DocPage extends StatelessWidget {
  const DocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

enum Actions { share, delete, archive }

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Doc> docs = allDoc;
  final items = List<String>.generate(0, (i) => "Item ${i + 1}");
  // AjoutDoc
  Future<void> _pickerImage(ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(source: source);
      if (result == null) return;
      File? img = File(result.path);
      img = await _cropImage(img);
      if (img != null) {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => AjoutDoc(imageFile: img),
          ),
          (Route<dynamic> route) => false,
        );
      }
    } on PlatformException catch (e) {
      print('$e');
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    final croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: items.isEmpty
              ? const emptyList()
              : SlidableAutoCloseBehavior(
                  closeWhenOpened: true,
                  child: ListView.builder(
                    itemCount: allDoc.length,
                    itemBuilder: (BuildContext context, int index) {
                      Doc doc = allDoc[index];
                      // final doc = docs[index];
                      return Slidable(
                        key: Key(doc.name),
                        startActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () =>
                                _onDismissed(index, Actions.share),
                          ),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.green,
                              icon: IconlyBroken.send,
                              label: 'Share',
                              onPressed: (context) =>
                                  _onDismissed(index, Actions.share),
                            ),
                            SlidableAction(
                              backgroundColor: Colors.blue,
                              icon: IconlyBroken.arrowDownSquare,
                              label: 'Archive',
                              onPressed: (context) =>
                                  _onDismissed(index, Actions.archive),
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          dismissible: DismissiblePane(
                              onDismissed: () =>
                                  _onDismissed(index, Actions.delete)),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.red,
                              icon: IconlyBroken.delete,
                              label: 'Delete',
                              onPressed: (context) =>
                                  _onDismissed(index, Actions.delete),
                            )
                          ],
                        ),
                        child: builderDocumentListTile(doc),
                      );
                    },
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            )),
            context: context,
            builder: (context) {
              DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.4,
                maxChildSize: 0.9,
                minChildSize: 0.32,
                builder: (context, ScrollController) => SingleChildScrollView(
                  controller: ScrollController,
                ),
              );
              return SizedBox(
                height: 200,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    picture_options(
                      icone: IconlyBroken.image,
                      textLabel: 'Browse Gallery',
                      onTap: () {
                        _pickerImage(ImageSource.gallery);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87),
                    ),
                    picture_options(
                      icone: IconlyBroken.camera,
                      textLabel: 'Use Camera',
                      onTap: () => _pickerImage(ImageSource.camera),
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Ajouter Document"),
        elevation: 12,
      ),
    );
  }

  void _onDismissed(int index, Actions action) {
    final doc = docs[index];
    setState(() {
      docs.removeAt(index);
    });
    switch (action) {
      case Actions.delete:
        _showSnackBar(context, '${doc.name} is deleted', Colors.red);
        break;
      case Actions.archive:
        _showSnackBar(context, '${doc.name} is archived', Colors.blue);
        break;
      case Actions.share:
        _showSnackBar(context, '${doc.name} is shared', Colors.green);
        break;
    }
  }

  void _showSnackBar(BuildContext context, String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Widget builderDocumentListTile(Doc doc) => Builder(builder: (context) {
      const BorderRadius.all(Radius.circular(30));
      const Padding(padding: EdgeInsets.all(30));
      return ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(doc.name),
        subtitle: Text(doc.type),
        leading: const Icon(IconlyBroken.paper),
        onTap: () {
          final slidable = Slidable.of(context)!;
          final isClosed = slidable.actionPaneType == ActionPaneType.none;
          if (isClosed) {
            slidable.openStartActionPane();
          } else {
            slidable.close();
          }
        },
      );
    });

Future<dynamic> Annulation(BuildContext context) {
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
                      builder: (BuildContext context) => BottomNavBar()),
                  (Route<dynamic> route) => route.isFirst);
            },
            child: Text('QUITTER'),
          ),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(65)),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'ANNULER',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    ),
  );
}

class picture_options extends StatelessWidget {
  final String textLabel;
  final IconData icone;
  final void Function()? onTap;

  const picture_options({
    super.key,
    required this.textLabel,
    required this.icone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MaterialButton(
        elevation: 5,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color(0xFFF5F6F9),
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icone),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                textLabel,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class emptyList extends StatelessWidget {
  const emptyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: getProportionateScreenHeight(50),
        ),
        const DefaultDocPage(
          svgPicture: 'assets/image/folder_empty.svg',
          text1: "Gérez vos documents médicaux",
          text2:
              "Recevez, partagez et gérez vos documents sur \nMy Health. Vos documents sont sécuriss grace aux \ntechniques de chiffrement avancées",
        ),
        const SizedBox(
          height: 35,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "En savoir plus",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class AjoutDoc extends StatefulWidget {
  final File? imageFile;
  const AjoutDoc({super.key, required this.imageFile});

  @override
  State<AjoutDoc> createState() => _AjoutDocState();
}

class _AjoutDocState extends State<AjoutDoc> {
  File? imageFile;
  List<File> images = [];

  int currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    if (widget.imageFile != null) {
      images.add(widget.imageFile!);
    }
  }

  void addNewImage(File image) {
    setState(() {
      images.add(image);
    });
  }

  void removeImage() {
    setState(() {
      if (currentIndex > 0) {
        images.removeAt(currentIndex);
        currentIndex--;
        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else if (images.isNotEmpty) {
        images.removeAt(0);
      }
    });
  }

  void nextImage() {
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex++;
        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  void previousImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        _pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ajout d'un nouveau document",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Annulation(context);
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
                images.isEmpty
                    ? Container(
                        height: getProportionateScreenWidth(400),
                        color: Colors.grey[500],
                      )
                    : SizedBox(
                        height: getProportionateScreenWidth(400),
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          children: images.map((image) {
                            return Image.file(
                              image,
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                        ),
                      ),
                SizedBox(
                  height: getProportionateScreenWidth(10),
                ),
                Text(
                  "Page ${currentIndex + 1} / ${images.length}",
                  style: const TextStyle(
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
                          onPressed: () async {
                            // Ajouter une photo a la liste
                            final pickedFile = await ImagePicker().getImage(
                                source: ImageSource.camera,
                                imageQuality: 50,
                                maxHeight: 800,
                                maxWidth: 800);

                            if (pickedFile != null) {
                              addNewImage(File(pickedFile.path));
                            }
                          },
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
                          onPressed: () {
                            // Supprimer une photo de la liste
                            removeImage();
                          },
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
  String name = '';

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
            Annulation(context);
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
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Nom du document",
                      hintStyle: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                      errorText:
                          nameInputIsValid ? null : '*Le nom est obligatoire!',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
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
                        child: Text(value),
                        alignment: Alignment.center,
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
                                      DocumentScreen()),
                              (Route<dynamic> route) => route.isFirst);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: isButtonEnabled()
                        ? kPrimaryColor
                        : Colors.grey.shade400,
                    minimumSize: Size(getProportionateScreenWidth(300), 50),
                    elevation: 10,
                    backgroundColor: kPrimaryColor,
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
