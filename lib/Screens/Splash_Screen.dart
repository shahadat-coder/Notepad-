import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/Screens/home_screens.dart';
import 'package:note_app/onboard/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {


  Future checkFirstTime () async{
    final prefs = await SharedPreferences.getInstance();
    String? isFirstTime = prefs.getString('is_first-time');

    if(isFirstTime == null){
      Get.offAll(()=>const OnboardScreen());
    }else{
      Get.offAll(()=>const HomeScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      checkFirstTime();
     // checkState();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset('assets/images/note.json'),
      ),
    );
  }
}
