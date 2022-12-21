
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:parking_system/logic/controller/authController.dart';
import 'package:parking_system/router/routes.dart';
import 'package:parking_system/utils/myString.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/auth/auth_button.dart';
import 'package:parking_system/view/widget/auth/container_under.dart';
import 'package:parking_system/view/widget/auth/textFormField.dart';
import 'package:sizer/sizer.dart';

class LoginEmailForm extends StatelessWidget {
  LoginEmailForm({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
                text: 'E-mail',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontsize: 11.sp,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 1.17.h,
          ),
          AuthTextFromField(
            controller: emailController,
            obscureText: false,
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value)) {
                return "Worng E-mail";
              } else {
                return null;
              }
            },
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.black,
            ),
            suffixIcon: const Text(''),
            hintText: "Enter your Email",
          ),
          SizedBox(
            height: 1.76.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
                text: 'Password',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontsize: 11.sp,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 1.17.h,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthTextFromField(
              maxLines: 1,
              controller: passwordController,
              obscureText: controller.isVisibilty ? false : true,
              validator: (value) {
                if (value.toString().length < 6) {
                  return " Worng password";
                } else {
                  return null;
                }
              },
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.black,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.Visibilty();
                },
                icon: controller.isVisibilty
                    ? Icon(Icons.visibility_outlined,
                        color: Colors.black, size: 20)
                    : Icon(Icons.visibility_off_outlined,
                        color: Colors.black, size: 20),
                iconSize: 18,
              ),
              hintText: "Enter your password",
            );
          }),
          SizedBox(
            height: 1.17.h,
          ),
          
          SizedBox(
            height: 3.75.h,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthButton(
              onPressed:
              
               () async {
                if (formKey.currentState!.validate()) {
                  String email = emailController.text.trim();
                  String password = passwordController.text;
                  print("dubg: ${email}");
                  controller.displayUserEmail.value = email;
                  controller.loginUsingFierbase(
                      email: email, password: password);
                  
                
                }
                
              },
              text: "Log In",
            );
          }),
          SizedBox(
            height: 1.17.h,
          ),
          Container_Under(
            text: 'Dont hava an account?',
            typetext: "Sign up",
            onPressed: () {
              Get.offNamed(Routes.signUpScreen);
            },
          ),
        ],
      ),
    );
  }
}
