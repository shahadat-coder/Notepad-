import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app/controllers/notes_controller.dart';
import 'package:note_app/routes/route_names.dart';
import 'package:note_app/utils/colors.dart';

class CustomSingleNotes extends StatelessWidget {
  const CustomSingleNotes({super.key, required this.index});

final int index;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NotesController());
    final note = controller.notes.elementAt(index);

    final createdDateFormat = DateFormat.yMMMEd().format(note.createdDate);
    final createdTimeFormat = DateFormat.jm().format(note.createdDate);

    final updatedDateFormat = DateFormat.yMMMEd().format(note.updatedDate ?? DateTime.now());
    final updatedTimeFormat = DateFormat.jm().format(note.updatedDate ?? DateTime.now());

    return InkWell(
      onTap: (){
        Get.toNamed(RouteNames.noteScreen,
          arguments: {
          'isUpdate' : true,
            'note' : note,
            'index' : index,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black.withOpacity(.2),
          )
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backgroundColors,
            ),
          ),
          title: Text(
            note.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              const SizedBox(height: 10,),
              note.updatedDate != null ? Text(
                'Updated : $createdDateFormat ,  $createdTimeFormat',
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 12,
                ),
              ): const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$updatedDateFormat ,  $updatedTimeFormat',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 12,
                    ),
                  ),
                  InkWell(onTap: (){
                    Get.snackbar('Deleted', '${note.title} has been deleted');
                   controller.deleteNote(index);
                  },child: const Icon(Icons.delete,size: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
