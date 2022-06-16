import 'package:get/get.dart';

import '../logic/bindings/auth_binding.dart';
import '../views/screens/auth/forget_pass_screen.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/auth/signup_screen.dart';
import '../views/screens/other/favorite_screen.dart';
import '../views/screens/other/homepage_screen.dart';
import '../views/screens/other/setting_screen.dart';
import '../views/screens/other/welcome_screen.dart';

class Routes {
//initialRoute
  static const String initialPage = Names.welcomeScreen;

//getPages
  static final getPages = [
    GetPage(name: Names.welcomeScreen, page: () => const WelcomeScreen()), //0
    GetPage(name: Names.homeScreen, page: () => const HomeScreen()), //1
    GetPage(name: Names.favoriteScreen, page: () => const FavoriteScreen()), //2
    GetPage(name: Names.settingScreen, page: () => const SettingScreen()), //3
    GetPage(
        name: Names.loginScreen,
        page: () => const LoginScreen(),
        binding: AuthBinding()), //4
    GetPage(
        name: Names.signupScreen,
        page: () => const SignUpScreen(),
        binding: AuthBinding()), //5
    GetPage(
        name: Names.forgotScreen,
        page: () => const ForgotPasswordScreen(),
        binding: AuthBinding()), //6
  ];
}

class Names {
  static const String welcomeScreen = '/WelcomeScreen'; //0
  static const String homeScreen = '/HomeScreen'; //1
  static const String favoriteScreen = '/FavoriteScreen'; //2
  static const String settingScreen = '/SettingScreen'; //3
  static const String loginScreen = '/LoginScreen'; //4
  static const String signupScreen = '/SignupScreen'; //5
  static const String forgotScreen = '/ForgotScreen'; //6
}
