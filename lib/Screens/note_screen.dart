import 'package:flutter/material.dart';
import 'package:note_app/utils/colors.dart';
import 'package:note_app/widgets/custom_button.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColors,
        bottom:  const PreferredSize(preferredSize: Size.fromHeight(1),
            child: Divider()),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.link)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              minLines: 1,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none
              ),
            ),
            Expanded(
              child: TextFormField(
                maxLines: 50,
                minLines: 50,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Describe about your notes'
                ),
              ),
            )
          ],
        ),

      ),
      bottomNavigationBar: CustomButton(title: 'Save Changes', onTap: () {  },),
    );
  }
}
