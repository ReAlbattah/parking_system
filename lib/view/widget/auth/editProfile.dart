import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_system/logic/controller/authController.dart';
import 'package:parking_system/router/routes.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.editProfileScreen);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Edit Profile  ",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
