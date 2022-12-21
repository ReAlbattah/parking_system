import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:parking_system/logic/controller/facilityController.dart';
import 'package:parking_system/view/screens/editFacilityScreen.dart';

import '../../../../model/modelMenu_item.dart';
import '../../../../model/menu_items.dart';

class PopupMenu extends StatelessWidget {
  String fid;
  String facilityName;
  String location;
  String numberOfParking;
  String? numberOfFacility;
  String image;

  PopupMenu({
    super.key,
    required this.fid,
    this.numberOfFacility,
    required this.facilityName,
    required this.location,
    required this.numberOfParking,
    required this.image,
  });
  final controller = Get.find<FacilityController>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemPoup>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (item) {
          onSelected(context, item);
        },
        itemBuilder: (context) => [
              ...MenuItems.menuItems.map(buildItem).toList(),
            ]);
  }

  PopupMenuItem<MenuItemPoup> buildItem(MenuItemPoup item) => PopupMenuItem(
      value: item,
      child: Container(
        width: 147,
        height: 64,
        child: Row(
          children: [
            Icon(item.icon),
            Text(" "),
            Text(
              item.text,
              style: TextStyle(color: item.color),
            )
          ],
        ),
      ));

  void onSelected(BuildContext context, MenuItemPoup item) {
    switch (item) {
      case MenuItems.itemUpdate:
        controller.facilityNameControlller.text = facilityName;
        controller.locationController.text = location;
        controller.numberOfParkingController.text = numberOfParking;
        controller.imgUrl = image;
        Get.to(EditFacilityScreen(
          fid: fid,
          facilityName: facilityName,
          location: location,
          numberOfParking: numberOfParking,
          image: image,
        ));
        break;
      case MenuItems.itemDelete:
        controller.deleteData(fid, facilityName);
        break;
    }
  }
}
