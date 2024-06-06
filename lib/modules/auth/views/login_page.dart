import 'package:dokan/app/routes.dart';
import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:dokan/modules/auth/views/signup_page.dart';
import 'package:dokan/modules/auth/widget/dokan_icon_button.dart';
import 'package:dokan/modules/auth/widget/dokan_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/auth/controllers/auth_controller.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends GetView<AuthController> {

  final AuthController authController = Get.find<AuthController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 45.w,
                  height: 20.h, child: Image.asset("assets/logo_dokan.png")),
              Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 5.h,
              ),
              DokanTextField(
                controller: usernameController,
                icon: DokanIcon.icon(DokanIcon.envelop, size: 14.sp, color: const Color(0xFF7C8592)),
                hint: "Email",
                isPassword: false,
                eyeVisibility: false,
              ),
              DokanTextField(
                controller: passwordController,
                icon: DokanIcon.icon(DokanIcon.lock, size: 17.sp, color: const Color(0xFF7C8592)),
                hint: "Password",
                isPassword: true,
                eyeVisibility: true,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
                  child: TextButton(
                    onPressed: () async {

                    },
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
                height: 5.h,
              ),
              Container(
                  height: 7.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
                  child: CupertinoButton(
                      onPressed: () async {



                      },
                      color: const Color(0xFFF75F55),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal),
                      ))
              ),
              SizedBox(
                height: 5.h,
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
                height: 5.h,
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
      ),
    );
  }

}
