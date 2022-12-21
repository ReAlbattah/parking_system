import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parking_system/view/widget/auth/loginEmailForm.dart';
import 'package:parking_system/view/widget/home/sideBar.dart';
import 'package:sizer/sizer.dart';

import '../../utils/textUtils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
      padding:
          const EdgeInsets.only(top: 110, bottom: 363, right: 45, left: 55),
      child: Center(
        // heightFactor: 2,
        child: Column(
          children: [
            Image.asset(
              'assets/images/loginImage.png',
              
            ),
            TextUtils(
              text: "Login ",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontsize: 14.sp,
              underLine: TextDecoration.none,
            ),
            SizedBox(
              height: 5.8.h,
            ),
            LoginEmailForm(),
          ],
        ),
      ),
    ));
  }
}
