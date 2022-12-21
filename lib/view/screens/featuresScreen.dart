import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/featuresCard.dart';
import 'package:sizer/sizer.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: TextUtils(
            text: 'Features',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontsize: 14.sp),
        backgroundColor: Colors.blue.shade900,
        elevation: 2,
      ),
      body: Center(
        child: Card(
          borderOnForeground: false,
          clipBehavior: Clip.antiAlias,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.8.h,
              ),
              FeaturesCard(
                icon: Icon(Icons.timer, color: Colors.white),
                text: 'Time Saving',
                details: 'Save your time by booking your\nparking spot online.',
              ),
              SizedBox(
                height: 5.h,
              ),
              FeaturesCard(
                icon: Icon(Icons.swipe_right_rounded, color: Colors.white),
                text: 'Easy to use',
                details:
                    'Easy to use our application to book\nyour parking spot.',
              ),
              SizedBox(
                height: 5.h,
              ),
              FeaturesCard(
                icon: Icon(Icons.monetization_on_rounded, color: Colors.white),
                text: 'Online Payment',
                details: 'Pay online for your parking spot\neasily and safely.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
