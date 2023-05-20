import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:untitle/Page/documents/model/note_data.dart';

import '../model/note.dart';

class EditingNotePage extends StatefulWidget {
  final Note note;
  final bool isNewNote;
  const EditingNotePage(
      {super.key, required this.note, required this.isNewNote});

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

// load existing note
  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  // add new note
  void addNewNote(int id) {
    // get text from Editor
    String titre = _controller.document.toPlainText();
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false)
        .addNewNote(Note(id: id, titre: titre, text: text));
  }

  // update existing note
  void updateNote() {
    // get text from editor
    String titre = _controller.document.toPlainText();
    String text = _controller.document.toPlainText();
    // update note
    Provider.of<NoteData>(context, listen: false)
        .updateNote(widget.note, titre, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: QuillToolbar.basic(
                  controller: _controller,
                  showAlignmentButtons: false,
                  showBackgroundColorButton: false,
                  showCenterAlignment: false,
                  showClearFormat: false,
                  showCodeBlock: false,
                  showDirection: false,
                  showDividers: false,
                  showFontFamily: false,
                  showHeaderStyle: false,
                  showIndent: false,
                  showInlineCode: false,
                  showJustifyAlignment: false,
                  showLeftAlignment: false,
                  showLink: false,
                  showListBullets: false,
                  showListCheck: false,
                  showListNumbers: false,
                  showQuote: false,
                  showRightAlignment: false,
                  showSearchButton: false,
                  showStrikeThrough: false,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
