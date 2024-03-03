import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/notes_controller.dart';
import 'package:note_app/models/notes_model.dart';
import 'package:note_app/utils/colors.dart';
import 'package:note_app/widgets/custom_button.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NotesController());

    final arg = Get.arguments != null ? Get.arguments as Map : {
      'isUpdate': false,
      'note': null,
    };
    final bool isUpdate = arg['isUpdate'] ?? false;
    final note = arg['note'] == null ? null : arg['note'] as NotesModel;
    final int? index = arg['index'] == null ? null : arg['index'] as int;

    final titleController = TextEditingController(
      text: isUpdate ? note!.title : null,
    );
    final descriptionController = TextEditingController(
      text: isUpdate ? note!.description : null,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Use this to control the shadow appearance
        backgroundColor: AppColors.backgroundColors,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                maxLines: 50,
                minLines: 50,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Describe about your notes',
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        title: 'Save Changes',
        onTap: () {
          if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
            Get.snackbar('Error', "You missed writing anywhere; that's why it doesn't work.");
          } else {
            isUpdate
                ? controller.updateNote(
                    index!,
                    NotesModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        createdDate: note!.createdDate,
                        updatedDate: DateTime.now(),
                    ))
                : controller.addNotes(
                    NotesModel(
                title: titleController.text,
                description: descriptionController.text,
                createdDate: DateTime.now(),
              ),
            );
            Get.back();
          }
        },
      ),
    );
  }
}