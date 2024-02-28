import 'package:get/get.dart';
import 'package:note_app/Screens/home_screens.dart';
import 'package:note_app/Screens/note_screen.dart';
import 'package:note_app/routes/route_names.dart';

class RoutePages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: RouteNames.home,
        page: ()=> const HomeScreen(),
    ),
    GetPage(name: RouteNames.noteScreen,
      page: ()=> const NoteScreen(),
    ),
  ];
}