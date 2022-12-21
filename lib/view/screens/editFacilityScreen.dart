import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parking_system/logic/controller/facilityController.dart';
import 'package:parking_system/view/widget/facilityTextField.dart';


class EditFacilityScreen extends StatelessWidget {
  TextEditingController test = TextEditingController();
   String? fid;
  final String facilityName;
  final String location;
  final String numberOfParking;
  int? numberOfFacility;
  String image;


  EditFacilityScreen(
      {Key? key,
       this.fid,
    this.numberOfFacility,
    required this.facilityName,
    required this.location,
    required this.numberOfParking,
    required this.image,
      })
      : super(key: key);

  final controller = Get.find<FacilityController>();
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            controller.clearController();
            Get.back();
          },
          child: Text("Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
        title: Text(
          "Edit ",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        // titleSpacing: 50,
        centerTitle: true,

        actions: [
          GetBuilder<FacilityController>(builder: (_) {
            return TextButton(
              onPressed: () {
                controller.updateFacility(
                    fid,
                    controller.facilityNameControlller,
                    controller.locationController,
                    controller.numberOfParkingController,
                    controller.numberOfFacilityController,
                    controller.imgUrl
                    );
                controller.clearController();
              },
              child: Text(
                "Edit",
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
                Text( 'Facility Name',
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
