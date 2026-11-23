import 'package:get/get.dart';
import 'package:pas_mobiledev/page/login_page.dart';
import 'package:pas_mobiledev/page/mainmenu_page.dart';


class Routes {
  static const String login = "/login";
    static const String mainMenu = "/main_menu";


  static final myPages = [
  GetPage(name: login, page: () => LoginPage()),
  GetPage(name: mainMenu, page: () => MainMenu()),

  
  ];
}
