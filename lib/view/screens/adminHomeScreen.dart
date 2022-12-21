import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:parking_system/logic/controller/facilityController.dart';
import 'package:parking_system/model/facility.dart';
import 'package:parking_system/router/routes.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/auth/auth_button.dart';
import 'package:parking_system/view/widget/emptyScreen.dart';
import 'package:parking_system/view/widget/facilitiesAdded.dart';
import 'package:sizer/sizer.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(FacilityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => Get.toNamed(Routes.profileScreen),
            child: Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
          )
        ],

        // automaticallyImplyLeading: false,
        title: TextUtils(
            text: 'Admin Home ',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontsize: 14.sp),

        backgroundColor: Colors.blue.shade900,
        elevation: 2,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(color: Colors.blue.shade50),
            flex: 2,
          ),
          Expanded(
            child: Container(color: Colors.transparent),
            flex: 7,
          ),
        ],
      );

  get content => Container(
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );

  get grid => Expanded(
        child: Container(
          //color: Colors.red,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.count(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 1,
            childAspectRatio: 1.90,
            children: [
              Container(
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.store_outlined,
                            size: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //color: Colors.amber,
                            width: 120,
                            height: 90,
                            child: Column(
                              children: [
                                Text(
                                  'FACILITES',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('${controller.facilities.length}')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Icon(
                            Icons.people_outline_rounded,
                            size: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            //color: Colors.amber,
                            width: 120,
                            height: 90,
                            child: Column(
                              children: [
                                Text(
                                  'USER',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text('# number')
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButton(
                    onPressed: () {
                      Get.toNamed(Routes.addFacilityScreen);
                    },
                    text: 'Add Facility',
                  ),

                  //       StreamBuilder(
                  // stream: controller.getData,
                  // builder: (context, snapshot) {
                  //   if (snapshot.hasData) {
                  //     print("not empty screen");
                  //     controller.facilities = snapshot.data!.docs
                  //         .map((e) => Facility(
                  //             fid: e['fid'],
                  //             facilityName: e['facilityName'],
                  //             numberOfFacility: e['numberOfFacility'],
                  //             location: e['location'],
                  //             numberOfParking: e['numberOfParking'],
                  //             image: e['image']))
                  //         .toList();
                  //     print("prodects.length   ${controller.facilities.length}");

                  //     if (controller.facilities.isNotEmpty) {
                  //       return FacilitiesAdded(
                  //         facility: controller.facilities,
                  //       );
                  //     } else {
                  //       print("empty screen");
                  //       return EmptyScreen();
                  //     }
                  //   } else {
                  //     return FacilitiesAdded(
                  //         facility: controller.facilities,
                  //       );
                  //   }
                  // }),
                ],
              ),
              StreamBuilder(
                  stream: controller.getData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("not empty screen");
                      controller.facilities = snapshot.data!.docs
                          .map((e) => Facility(
                              fid: e['fid'],
                              facilityName: e['facilityName'],
                              numberOfFacility: e['numberOfFacility'],
                              location: e['location'],
                              numberOfParking: e['numberOfParking'],
                              image: e['image']))
                          .toList();
                      print(
                          "prodects.length   ${controller.facilities.length}");

                      if (controller.facilities.isNotEmpty) {
                        return FacilitiesAdded(
                          facility: controller.facilities,
                        );
                      } else {
                        print("empty screen");
                        return EmptyScreen();
                      }
                    } else {
                      return FacilitiesAdded(
                        facility: controller.facilities,
                      );
                    }
                  }),
            ],
          ),
        ),
      );
}
