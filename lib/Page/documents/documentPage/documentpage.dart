import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constant.dart';
import '../../component/defaultDocpage.dart';
import '../../component/picture_options.dart';
import '../model/model.dart';

class Doc_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBD0909),
      body: Body(),
    );
  }
}

enum Actions { share, delete, archive }

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<User> users = allUsers;
  final items = List<String>.generate(0, (i) => "Item ${i + 1}");

  File? _image;

  Future _pickerImage(ImageSource source) async {
    try {
      log('Pick');
      final result = await ImagePicker().pickImage(source: source);
      if (result == null) return;
      File? img = File(result.path);
      img = await _cropImage(img);
      setState(() => _image = img);
    } on PlatformException catch (e) {
      log('$e');
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.isEmpty
          ? const emptyList()
          : SlidableAutoCloseBehavior(
              closeWhenOpened: true,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Slidable(
                    key: Key(user.name),
                    startActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        dismissible: DismissiblePane(
                          onDismissed: () => _onDismissed(index, Actions.share),
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
                        ]),
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
                        ]),
                    child: builderUserListTile(user),
                  );
                },
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
                      onTap: () {},
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
          // setState(() {
          //   items.add('Item ');
          // });
        },
        icon: const Icon(Icons.add),
        label: const Text("Ajouter Document"),
        elevation: 12,
      ),
    );
  }

  void _onDismissed(int index, Actions action) {
    final user = users[index];
    setState(() {
      users.removeAt(index);
    });
    switch (action) {
      case Actions.delete:
        _showSnackBar(context, '${user.name} is deleted', Colors.red);
        break;
      case Actions.archive:
        _showSnackBar(context, '${user.name} is archived', Colors.blue);
        break;
      case Actions.share:
        _showSnackBar(context, '${user.name} is shared', Colors.green);
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

  Widget builderUserListTile(User user) => Builder(builder: (context) {
        return ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(user.name),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(user.image),
          ),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
            child: const Text(
              "En savoir plus",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
