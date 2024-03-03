import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/route_names.dart';
import '../utils/colors.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  Future writeData() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('is_first-time', 'no');
  }

  readData() async{
    final prefs = await SharedPreferences.getInstance();
   bool isFirstTime =  prefs.getBool('is_first-time') ?? true;
   print('Is first time $isFirstTime');
  }

  deleteData ()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('is_first-time');
  }

@override
  void initState() {
    super.initState();
    // writeData();
    // readData();
    deleteData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Image.asset('assets/images/notepad.png'),
         const SizedBox(height: 15,),
         const Text('Notepad is a free text editor that provides additional features not found in the standard Windows text editor',
         maxLines: 2,
           textAlign: TextAlign.center,
         ),
       ],
     ),
   ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.primaryColors,
          onPressed: () {
            Get.toNamed(RouteNames.home);
          },
          label: const Row(
           children: [
             Text('Here',style: TextStyle(
               color: Colors.white
             ),),
             SizedBox(width: 2,),
             Icon(Icons.arrow_forward_ios,size: 15,color: Colors.white,)
    ],
    )
    ),
    );
  }
}
