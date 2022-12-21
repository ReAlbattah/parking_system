import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parking_system/logic/controller/facilityController.dart';
import 'package:parking_system/model/facility.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/facilityTextField.dart';

class AddFacilityFromScreen extends StatelessWidget {
  AddFacilityFromScreen({Key? key}) : super(key: key);

  final controller = Get.put(FacilityController());

  // final controller = Get.find<AddProductController>();
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var s = null.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
        title: Text(
          "Add new Facility",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        // titleSpacing: 50,
        centerTitle: true,

        actions: [
          GetBuilder<FacilityController>(builder: (_) {
            return TextButton(
              onPressed: () async {
                if (myKey.currentState!.validate()) {
                  Facility facility = Facility(
                      facilityName: controller.facilityNameControlller.text,
                      location: controller.locationController.text,
                      numberOfParking:
                          int.parse(controller.numberOfParkingController.text),
                      // numberOfFacility:
                      //     int.parse(controller.numberOfFacilityController.text),
                      image: controller.imgUrl);
                  if (controller.pickedFile == null) {
                    print("no image slected");
                    Get.snackbar(
                      "Eroor",
                      "You must add image please",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                    );
                  }
                  await controller.addFacility(facility);
                } else {
                  return;
                }
              },
              child: Text(
                "Add ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            );
          })
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 56),
          child: Form(
            key: myKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Facility Name',
                ),
                SizedBox(
                  height: 8,
                ),
                FacilityTextField(
                  height: 40,
                  width: 361,
                  controller: controller.facilityNameControlller,
                  obscureText: false,
                  hintText: 'Facility Name',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter Facility Name Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  ' location',
                ),
                SizedBox(
                  height: 8,
                ),
                FacilityTextField(
                  height: 40,
                  width: 361,
                  controller: controller.locationController,
                  obscureText: false,
                  hintText: 'Location',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter location Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Number of parking',
                ),
                SizedBox(
                  height: 8,
                ),
                FacilityTextField(
                  height: 40,
                  width: 361,
                  controller: controller.numberOfParkingController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  hintText: 'number of parking',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter number of parking Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  ' Price per hour',
                ),
                SizedBox(
                  height: 8,
                ),
                FacilityTextField(
                  height: 40,
                  width: 361,
                  controller: controller.priceController,
                  obscureText: false,
                  hintText: 'Price per hour',
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Enter price Please';
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.TakePhoto(ImageSource.gallery);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(217, 217, 217, 1),
                      padding: EdgeInsets.all(16),
                      minimumSize: Size(1, 6)),
                  child: Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Add Image",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
