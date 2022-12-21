import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:sizer/sizer.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

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
      body: Center(child: Text('No reservations yet')),
    );
  }
}
