import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:parking_system/logic/controller/facilityController.dart';
import 'package:parking_system/model/facility.dart';
import 'package:parking_system/router/routes.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/screens/facilitesScreen.dart';
import 'package:parking_system/view/widget/cart_item_customer.dart';
import 'package:parking_system/view/widget/facilitiesCard.dart';
import 'package:sizer/sizer.dart';

import '../widget/home/sideBar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(FacilityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: TextUtils(
            text: 'Home',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontsize: 14.sp),
        backgroundColor: Colors.blue.shade900,
        elevation: 2,
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.facilities = snapshot.data!.docs
                    .map((e) => Facility(
                        fid: e['fid'],
                        facilityName: e['location'],
                        location: e['location'],
                        numberOfParking: e['numberOfParking'],
                        image: e['image']))
                    .toList();

                print('leeength ${controller.facilities.length}');
                if (controller.facilities.isNotEmpty) {
                  return CardItem(facilities: controller.facilities);
                } else {
                  return Text("No thing");
                }
              } else {
                return CardItem(facilities: controller.facilities);
              }
            },
          ),

        ],
      ),
    );
    // );
  }
}
