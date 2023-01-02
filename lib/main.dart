//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:parking_system/logic/binding/authBinding.dart';
import 'package:parking_system/router/routes.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
              primaryColor: Colors.blue.shade900,
              focusColor: Colors.blue.shade900),
          debugShowCheckedModeBanner: false,
          color: Colors.green.shade100,
          title: 'parking System',

          // initialRoute: FirebaseAuth.instance.currentUser != null ||
          //         GetStorage().read<bool>("auth") == true
          //     ? Routes.homeScreen
          //     : AppRoutes.login,
          initialRoute: Routes.loginScreen,
          getPages: AppRoutes.routs,
          initialBinding: AuthBinding(),
        );
      },
    );
  }
}
