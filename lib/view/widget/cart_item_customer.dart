import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_system/logic/controller/facilityController.dart';
import 'package:parking_system/router/routes.dart';
import 'package:parking_system/view/widget/auth/auth_button.dart';

class CardItem extends StatelessWidget {
  final controller = Get.find<FacilityController>();
  List facilities = [];

  CardItem({Key? key, required this.facilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: facilities.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: .8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 15.0,
                maxCrossAxisExtent: 214
                ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${facilities[index].image}'),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: AuthButton(
                                onPressed: () {
                                  Get.toNamed(Routes.addReservationsScreen);
                                },
                                text: 'Make Reservation')),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
