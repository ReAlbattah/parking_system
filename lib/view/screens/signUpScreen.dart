import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/auth/signUpEmailForm.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
      padding: const EdgeInsets.only(right: 45, left: 55),
      child: Center(
        // heightFactor: 2,
        child: Column(
          children: [
            Image.asset(
              'assets/images/loginImage.png',
            ),
            TextUtils(
              text: "Sign Up ",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontsize: 14.sp,
              underLine: TextDecoration.none,
            ),
            // SizedBox(
            //   height: 5.8.h,
            // ),
            SignUpEmailForm(),
          ],
        ),
      ),
    ));
  }
}
