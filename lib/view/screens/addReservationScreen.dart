import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parking_system/router/routes.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/auth/auth_button.dart';
import 'package:parking_system/view/widget/auth/textFormField.dart';
import 'package:sizer/sizer.dart';

class AddReservationsScreen extends StatelessWidget {
  AddReservationsScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController plateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        elevation: 2,
        title: const Text(
          'Reservation',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(right: 50, left: 50, top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.1.h,
              ),
              TextUtils(
                  text: 'Car plate',
                  fontsize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 1.1.h,
              ),
              AuthTextFromField(
                controller: plateController,
                obscureText: false,
                prefixIcon: const Icon(
                  Icons.directions_car_filled_sharp,
                  color: Colors.black,
                ),
                suffixIcon: const Text(''),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Enter your car plate ';
                  } else {
                    return null;
                  }
                },
                hintText: 'Enter your car plate',
              ),
              SizedBox(
                height: 5.1.h,
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMMM, yyyy ',
                initialValue: '',
                firstDate: DateTime(2021),
                lastDate: DateTime(2024),
                dateLabelText: 'Select the Date',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              DateTimePicker(
                type: DateTimePickerType.time,
                dateMask: 'hh:mm a',
                initialValue: '',
                initialTime: TimeOfDay.now(),
                timeLabelText: 'From',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              DateTimePicker(
                type: DateTimePickerType.time,
                dateMask: 'hh:mm a',
                initialValue: '',
                initialTime: TimeOfDay.now(),
                timeLabelText: 'To',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(
                height: 5.1.h,
              ),
              AuthButton(
                  onPressed: () {
                    Get.offNamed(Routes.homeScreen);
                    FirebaseCrashlytics.instance.crash();
                  },
                  text: 'Save')
            ],
          ),
        ),
      ),
    );
  }
}
