import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:parking_system/logic/controller/authController.dart';
import 'package:parking_system/router/routes.dart';
import 'package:parking_system/view/screens/homeScreen.dart';
import 'package:sizer/sizer.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 2.3.h,
          ),
          DrawerHeader(
            // decoration:
            //     BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blue.shade900,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Welcom ${authController.displayUserName.toString().capitalize} ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 10.5.h,
          ),
          // ListTile(
          //   selectedColor: Colors.blue,
          //   title: const Text('Home '),
          //   onTap: () => Get.toNamed(Routes.homeScreen),
          // ),
          ListTile(
            title: const Text('Reservations '),
            onTap: () => Get.toNamed(Routes.reservationScreen),
          ),
          // ListTile(
          //   selectedColor: Colors.blue,
          //   title: const Text('Facilities '),
          //   onTap: () => Get.toNamed(Routes.facilitiesScreen),
          // ),
          ListTile(
            title: const Text('Features '),
            onTap: () => Get.toNamed(Routes.featuresScreen),
          ),
          SizedBox(
            height: 2.3.h,
          ),
          ListTile(
            title: const Text('Profile '),
            onTap: () => Get.toNamed(Routes.profileScreen),
          ),
        ],
      ),
    );
  }
}
