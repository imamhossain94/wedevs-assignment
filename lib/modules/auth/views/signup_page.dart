import 'package:dokan/app/routes.dart';
import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:dokan/core/utils/string_extension.dart';
import 'package:dokan/modules/auth/widget/dokan_icon_button.dart';
import 'package:dokan/modules/auth/widget/dokan_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends GetView<AuthController> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.h),
              child: Stack(
                children: [
                  SizedBox(
                    height: 130.w,
                    width: 130.w,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(65.w),
                      ),
                      child: Center(
                        child: DokanIcon.icon(DokanIcon.user,
                            size: 30.sp, color: const Color(0xFF7C8592)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40.w,
                      width: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
                        ),
                      ),
                      child: DokanIcon.icon(DokanIcon.camera,
                          size: 14.sp, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            DokanTextField(
              controller: _usernameController,
              icon: DokanIcon.icon(DokanIcon.user,
                  size: 18.sp, color: const Color(0xFF7C8592)),
              hint: "Name",
              isPassword: false,
              eyeVisibility: false,
            ),
            DokanTextField(
              controller: _emailController,
              icon: DokanIcon.icon(DokanIcon.envelop,
                  size: 14.sp, color: const Color(0xFF7C8592)),
              hint: "Email",
              isPassword: false,
              eyeVisibility: false,
            ),
            DokanTextField(
              controller: _passwordController,
              icon: DokanIcon.icon(DokanIcon.lock,
                  size: 17.sp, color: const Color(0xFF7C8592)),
              hint: "Password",
              isPassword: true,
              eyeVisibility: false,
            ),
            DokanTextField(
              controller: _confirmPasswordController,
              icon: DokanIcon.icon(DokanIcon.lock,
                  size: 17.sp, color: const Color(0xFF7C8592)),
              hint: "Confirm Password",
              isPassword: true,
              eyeVisibility: false,
            ),
            SizedBox(
              height: 35.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 0),
              child: CupertinoButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          final username = _usernameController.text.trim();
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();
                          final confirmPassword =
                              _confirmPasswordController.text.trim();

                          if (username.length < 4) {
                            Fluttertoast.showToast(
                              msg: "Username should be at least 4 characters",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          } else if (!email.isValidEmail()) {
                            Fluttertoast.showToast(
                              msg: "Please enter a valid email address",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          } else if (password.length < 6) {
                            Fluttertoast.showToast(
                              msg:
                                  "Password should be greater than or equal to 6 characters",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          } else if (password != confirmPassword) {
                            Fluttertoast.showToast(
                              msg: "Passwords do not match",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          } else {
                            controller.signUp(username, email, password);
                          }
                        },
                  color: const Color(0xFFF75F55),
                  child: Obx(() => controller.isLoading.value
                      ? SizedBox(
                      height: 15.w,
                      width: 15.w,
                      child: const CircularProgressIndicator(
                          strokeWidth: 1,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                          ))
                      : Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        ))),
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DokanIconButton(
                  icon: DokanIcon.icon(DokanIcon.facebook, size: 14.sp),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 5.w,
                ),
                DokanIconButton(
                  icon: DokanIcon.icon(DokanIcon.google, size: 14.sp),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      //color: Color(0xFF383C40),
                      fontSize: 14.sp,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.LOGIN);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: const Color(0xFF2893E3),
                        fontSize: 14.sp,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
