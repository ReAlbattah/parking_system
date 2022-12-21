import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_system/logic/controller/authController.dart';
import 'package:parking_system/logic/controller/settingController.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/screens/editProfileScreen.dart';
import 'package:parking_system/view/widget/auth/editProfile.dart';
import 'package:parking_system/view/widget/auth/logout.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(SettingController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("image path ${controller.imagePath1}");
    print("username ${authController.displayUserName.value}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          // automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetBuilder<AuthController>(builder: (_) {
          return Obx(() => Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: authController.displayUserPhoto.value == ""
                                ? const AssetImage("assets/images/avtar.png")
                                    as ImageProvider
                                : NetworkImage(
                                    authController.displayUserPhoto.value,
                                  ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextUtils(
                        text: authController.displayUserName.value,
                        color: Colors.black,
                        fontsize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.6.h,
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: TextUtils(
                        text: authController.displayDescription.value,
                        color: Colors.black87,
                        fontsize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.6.h,
                    // ),
                    Align(
                      alignment: Alignment.center,
                      child: TextUtils(
                        text: authController.displayUserEmail.value,
                        color: Colors.black45,
                        fontsize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextUtils(
                        fontsize: 14.sp,
                        fontWeight: FontWeight.bold,
                        text: "Account",
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    EditProfile(),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    LogOut(),
                    //  SettingsWidget(),
                  ],
                ),
              ));
        }));
  }
}
