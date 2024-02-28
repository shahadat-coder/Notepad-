import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Screens/home_screens.dart';
import 'package:note_app/utils/colors.dart';

import 'routes/route_names.dart';
import 'routes/route_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColors
      ),
      getPages: RoutePages.routes,
      initialRoute:  RouteNames.home,
      // home: const HomeScreen(),
    );
  }
}


