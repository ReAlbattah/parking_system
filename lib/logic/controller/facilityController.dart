import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:parking_system/model/facility.dart';

class FacilityController extends GetxController {
  late TextEditingController fidController,
      facilityNameControlller,
      locationController,
      priceController,
      numberOfParkingController,
      numberOfFacilityController;

  File? pickedFile;
  String imgUrl = "";
  final imagePicker = ImagePicker();

  final getData = FirebaseFirestore.instance.collection('facility').snapshots();

  List<dynamic> facilities = [];

  //update varible
  var facilityName = ''.obs;
  var location = ''.obs;
  var numberOfParking = ''.obs;
  var numberOfFacility = ''.obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    fidController = TextEditingController();
    facilityNameControlller = TextEditingController();
    locationController = TextEditingController();
    priceController = TextEditingController();
    numberOfParkingController = TextEditingController();
    numberOfFacilityController = TextEditingController();
  }

  // add to firebase

  Future<void> addFacility(Facility facility) async {
    if (pickedFile == null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("facilityImage")
          .child(facilityNameControlller.text + ".jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    } else {
      final ref = FirebaseStorage.instance
          .ref()
          .child("facilityImage")
          .child(facilityNameControlller.text + ".jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }
    // we nede Refrence to firebase
    final facilityRef = FirebaseFirestore.instance.collection('facility').doc();
    // prodect.productNumber = prodectRef.id;
    facility.image = imgUrl.toString();
    final data = facility.toJson(); // insert to fiserbase
    facilityRef.set(data).whenComplete(() {
      clearController();
      Get.snackbar("", "Added successfully..");
      // Get.to(StockScreen());
      update();
    }).catchError((error) {
      Get.snackbar("Error", "something went wrong");
    });
  }

  Future<void> TakePhoto(ImageSource sourse) async {
    final pickedImage =
        await imagePicker.pickImage(source: sourse, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    print("..............");
    print(pickedFile);
    print("..............");
  }

  // update on firebase

  Future<void> updateFacility(
      fidController,
      facilityNameControlller,
      locationController,
      numberOfParkingController,
      numberOfFacilityController,
      imgUrl) async {
    facilityName.value = facilityNameControlller.text;
    location.value = locationController.text;
    numberOfParking.value = numberOfParkingController.text;
    numberOfFacility.value = numberOfFacilityController.text;
    imgUrl;

    final ref = FirebaseStorage.instance
        .ref()
        .child("facilityImage")
        .child(facilityNameControlller.text + ".jpg");
    if (pickedFile == null) {
    } else {
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }

    final docProduct = FirebaseFirestore.instance
        .collection("facility")
        .doc(facilityNameControlller);
    docProduct.update({
      "facilityName": facilityName.value,
      "location": location.value,
      "numberOfParking": int.parse(numberOfParking.value),
      "numberOfFacility": int.parse(numberOfFacility.value),
      "image": imgUrl.toString(),
    }).whenComplete(() {
      print("update done");
      Get.snackbar("", "Update successfully..");
      clearController();
      update();
      // Get.toNamed(Routes.stockScreen);
    });
  }

  // delete on firebase
  Future<void> deleteData(fidController, fidControlller) async {
    await FirebaseFirestore.instance
        .collection('facility')
        .doc(fidController)
        .delete()
        .whenComplete(() async {
      Get.snackbar("", "Delete successfully..");
      print("delete ${fidController}");

      FirebaseStorage.instance
          .ref()
          .child("facilityImage/")
          .child(facilityNameControlller.text + ".jpg")
          .delete()
          .whenComplete(() => print("image delete"));
    });
  }

  // clear Controller
  void clearController() {
    facilityNameControlller.clear();
    locationController.clear();
    numberOfParkingController.clear();
    numberOfFacilityController.clear();
    pickedFile = null;
  }

  // List<dynamic> favouritesList = [].obs;
  // List<dynamic> prodectsFavourites = [];

  // void manageFavourites(String id) {
  //   print('First isFav ${isFave(id)}');
  //   for (var i = 0; i < prodects.length; i++) {
  //     var fromj = prodectToJson(prodects[i]);
  //     var x = prodectFromJson(fromj);
  //     var y = x.toJson();
  //     if (y['productName'] == id && isFave(id) == false) {
  //       favouritesList.add(y);
  //       print("added!!!");
  //     }
  //   }
  //   print('Seconed isFav ${isFave(id)}');
  // }

  // bool isFave(String productName) {
  //   return favouritesList
  //       .any((element) => element['productName'] == productName);
  // }
}
