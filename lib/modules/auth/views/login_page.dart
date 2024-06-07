import 'package:dokan/app/routes.dart';
import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:dokan/core/utils/string_extension.dart';
import 'package:dokan/modules/auth/widget/dokan_icon_button.dart';
import 'package:dokan/modules/auth/widget/dokan_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends GetView<AuthController> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 160.w,
                height: 200.h,
                child: Image.asset("assets/logo_dokan.png")),
            Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 28.sp,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              height: 25.h,
            ),
            DokanTextField(
              controller: _usernameController,
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
              eyeVisibility: true,
            ),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0),
                child: TextButton(
                  onPressed: () async {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: const Color(0xFFA4A9AF),
                        fontSize: 12.sp,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  ),
                )),
            SizedBox(
              height: 35.h,
            ),
            Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
                child: CupertinoButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            final username = _usernameController.text.trim();
                            final password = _passwordController.text.trim();

                            if (username.length < 4 ||
                                (username.contains('@') &&
                                    !username.isValidEmail())) {
                              Fluttertoast.showToast(
                                msg: "Invalid username or email",
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            } else if (password.length < 6) {
                              Fluttertoast.showToast(
                                msg:
                                    "Password should be greater than or equal to 6 characters",
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            } else {
                              controller.login(username, password);
                            }
                          },
                    color: const Color(0xFFF75F55),
                    child: Obx(() => controller.isLoading.value
                        ? SizedBox(
                            height: 15.w,
                            width: 15.w,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white)))
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          )))),
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
            TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.SIGNUP);
              },
              child: Text(
                "Create New Account",
                style: TextStyle(
                    color: const Color(0xFF383C40),
                    fontSize: 14.sp,
                    fontFamily: "Roboto",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
