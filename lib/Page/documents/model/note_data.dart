import 'note.dart';
import 'package:flutter/material.dart';

class NoteData extends ChangeNotifier {
// declaration liste des notes
  List<Note> allNotes = [
//default first note
    Note(
        id: 0,
        titre: 'Premiere note',
        text:
            "Conserver vos notes directement depuis l'application, pour une utilisation future."),
  ];

  // get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

// add a new note
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

// update note
  void updateNote(Note note, String titre, String text) {
    // go thru list of all notes
    for (int i = 0; i < allNotes.length; i++) {
      // find the relevant note
      if (allNotes[i].id == note.id) {
        // replace text
        allNotes[i].text = text;
        allNotes[i].titre = titre;
      }
    }
    notifyListeners();
  }

  // delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
