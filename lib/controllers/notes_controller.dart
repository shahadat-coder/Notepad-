import 'package:get/get.dart';
import 'package:note_app/models/notes_model.dart';

class NotesController extends GetxController {

  RxList <NotesModel> notes = <NotesModel> [].obs;

  addNotes (NotesModel noteData){
    notes.add(noteData);
    update();
  }
  deleteNote(int index){
    notes.removeAt(index);
    update();

  }
  updateNote(int index, NotesModel notesData){
    notes[index] = notesData;
    update();
  }
}