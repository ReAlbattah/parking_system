import 'package:get/route_manager.dart';
import 'package:parking_system/logic/binding/authBinding.dart';
import 'package:parking_system/view/screens/addFacilityFormScreen.dart';
import 'package:parking_system/view/screens/addReservationScreen.dart';
import 'package:parking_system/view/screens/adminHomeScreen.dart';
import 'package:parking_system/view/screens/editProfileScreen.dart';
import 'package:parking_system/view/screens/featuresScreen.dart';
import 'package:parking_system/view/screens/homeScreen.dart';
import 'package:parking_system/view/screens/loginScreen.dart';
import 'package:parking_system/view/screens/profileScreen.dart';
import 'package:parking_system/view/screens/reservationScreen.dart';
import 'package:parking_system/view/screens/signUpScreen.dart';

class AppRoutes {
  static const login = Routes.loginScreen;

  static final routs = [
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.adminHomeScreen,
      page: () => AdminHomeScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.reservationScreen,
      page: () => ReservationScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.featuresScreen,
      page: () => FeaturesScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.addReservationsScreen,
      page: () => AddReservationsScreen(),
      binding: AuthBinding(),
    ),
     GetPage(
      name: Routes.addFacilityScreen,
      page: () => AddFacilityFromScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const loginScreen = '/logingScreen';
  static const signUpScreen = '/signUpScreen';
  static const profileScreen = '/profileScreen';
  static const homeScreen = '/homeScreen';
  static const adminHomeScreen = '/adminHomeScreen';
  static const reservationScreen = '/reservationScreen';
  // static const facilitiesScreen = '/facilitiesScreen';
  static const featuresScreen = '/featuresScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const addReservationsScreen = '/addReservationsScreen';
  static const addFacilityScreen = '/addFacilityScreen';
}
