import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_system/logic/controller/facilityController.dart';
import 'package:parking_system/view/widget/popup_menu.dart';
import '../../../../model/menu_items.dart';

class FacilitiesAdded extends StatelessWidget {
  List<dynamic> facility;
  FacilitiesAdded({super.key, required this.facility});
  final controller = Get.find<FacilityController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: facility.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(
              // left: 20,
              // right: 20,
              top: 2,
            ),
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                // color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  height: 106,
                  width: 250,
                  // margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: NetworkImage('${facility[index].image}'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    ' \t  Available parking ${facility[index].numberOfParking}',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1)),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
