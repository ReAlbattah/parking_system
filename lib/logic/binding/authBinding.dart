import 'package:get/get.dart';

import '../controller/authController.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());

  }
}