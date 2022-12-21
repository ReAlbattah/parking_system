import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_system/logic/controller/authController.dart';
import 'package:parking_system/router/routes.dart';
import 'package:parking_system/utils/myString.dart';
import 'package:parking_system/utils/textUtils.dart';
import 'package:parking_system/view/widget/auth/container_under.dart';
import 'package:parking_system/view/widget/auth/textFormField.dart';
import 'package:sizer/sizer.dart';
import 'auth_button.dart';

class SignUpEmailForm extends StatelessWidget {
  SignUpEmailForm({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          TextUtils(
              text: 'Name',
              fontsize: 11.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          AuthTextFromField(
            controller: nameController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
            suffixIcon: const Text(''),
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Enter your name ';
              } else {
                return null;
              }
            },
            hintText: 'Enter your name',
          ),
          SizedBox(
            height: 1.7.h,
          ),
          TextUtils(
              text: 'E-mail',
              fontsize: 11.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          AuthTextFromField(
            controller: emailController,
            obscureText: false,
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: Colors.black,
            ),
            suffixIcon: const Text(''),
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value)) {
                return 'Invalid Email';
              } else {
                return null;
              }
            },
            hintText: 'Enter your E-mail',
          ),
          SizedBox(
            height: 1.7.h,
          ),

          TextUtils(
              text: 'Phone Number',
              fontsize: 11.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          AuthTextFromField(
            controller: phoneNumberController,
            numCode: "+966 ",
            obscureText: false,
            prefixIcon: const Icon(
              Icons.phone_outlined,
              color: Colors.black,
            ),
            suffixIcon: const Text(''),
            validator: (value) {
              if (!RegExp(validationNumber).hasMatch(value)) {
                return 'Invalid phone number';
              } else {
                return null;
              }
            },
            hintText: '53*******',
          ),
          SizedBox(
            height: 1.7.h,
          ),
          TextUtils(
              text: 'Password',
              fontsize: 11.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              underLine: TextDecoration.none),
          SizedBox(
            height: 1.1.h,
          ),
          GetBuilder<AuthController>(
            builder: (_) {
              return AuthTextFromField(
                maxLines: 1,
                controller: passwordController,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.Visibilty();
                  },
                  icon: controller.isVisibilty
                      ? Icon(
                          Icons.visibility_outlined,
                          color: Colors.black,
                          size: 2.3.h,
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          color: Colors.black,
                          size: 2.3.h,
                        ),
                ),
                obscureText: controller.isVisibilty ? false : true,
                validator: (value) {
                  if (!RegExp(validationPassword).hasMatch(value)) {
                    return 'Password length must be 8 and contain a number,\n a special symbol, and an uppercase letter.';
                  } else {
                    return null;
                  }
                },
                hintText: 'Enter your password',
              );
            },
          ),
          SizedBox(
            height: 1.7.h,
          ),
          Container(
            alignment: Alignment.center,
            child: GetBuilder<AuthController>(
              builder: (_) {
                return AuthButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        String password = passwordController.text;
                        String name = nameController.text;
                        String phoneNumber = phoneNumberController.text;

                        controller.signUpUsingFirebase(
                            phoneNumber: phoneNumber,email: email, password: password, name: name);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                      }
                    },
                    text: 'Sign Up');
              },
            ),
          ),
          SizedBox(
            height: 1.17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container_Under(
                text: 'Already have account ?',
                typetext: "Login",
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
