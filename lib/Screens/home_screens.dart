import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/notes_controller.dart';
import 'package:note_app/routes/route_names.dart';
import 'package:note_app/utils/colors.dart';
import 'package:note_app/widgets/custom_single_notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NotesController());

    return Scaffold(
      body: Container(
        color: AppColors.backgroundColors,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'My Notes',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.search)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Obx(() => SingleChildScrollView(
                      child: Column(
                        children: [
                          controller.notes.isEmpty ? const Center(
                            child: Text('No Notes Available'),
                          ) :
                          ListView.builder(
                              itemCount: controller.notes.length,
                              shrinkWrap: true,
                              primary: false,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return  CustomSingleNotes(
                                  index: index);
                              }),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.primaryColors,
          onPressed: () {
            Get.toNamed(RouteNames.noteScreen);
          },
          label: const Text('Add notes',
            style: TextStyle(
              color: Colors.white
            ),
          )),

    );
  }
}
