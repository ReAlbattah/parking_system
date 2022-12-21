import 'package:get/get.dart';
import 'package:parking_system/logic/controller/facilityController.dart';



class FacilityBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<FacilityController>(FacilityController());
  }
}
