import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:untitle/Page/documents/model/note.dart';
import 'package:untitle/Page/documents/model/note_data.dart';

import '../../../utils/constant.dart';
import 'editing_note_page.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // create a new note
  void createNewNote() {
    // create a new id
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    // create a blank note
    Note newNote = Note(
      id: id,
      titre: '',
      text: '',
    );
// go to edit the note
    goToNotePage(newNote, true);
  }

// go to note editing page
  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditingNotePage(
          note: note,
          isNewNote: true,
        ),
      ),
    );
  }

  // delete note
  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CupertinoListSection.insetGrouped(
                    children: List.generate(
                  value.getAllNotes().length,
                  (index) => CupertinoListTile(
                    title: Text(value.getAllNotes()[index].titre),
                  ),
                ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kPrimaryColor,
          onPressed: createNewNote,
          icon: const Icon(IconlyBroken.paperPlus),
          label: const Text("Ajouter Note"),
          elevation: 12,
        ),
      ),
    );
  }
}
