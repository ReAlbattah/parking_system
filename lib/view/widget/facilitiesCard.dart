import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/auth/auth_button.dart';
import 'package:sizer/sizer.dart';

class FacilitiesCard extends StatelessWidget {
  // final int numberOfParking;
  final String locations;
  final Image image;
  final Function() onPressed;

  FacilitiesCard({
    super.key,
    required this.image,
    required this.locations,
    required this.onPressed,
    // required this.numberOfParking,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.blue.shade200,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            image,
            SizedBox(
              height: 1.5.h,
            ),
            TextUtils(
                text: locations,
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontsize: 11.sp),
            SizedBox(
              height: 1.5.h,
            ),
            AuthButton(onPressed: onPressed, text: 'Make Reservation')
          ],
        ),
      ),
    );
  }
}
