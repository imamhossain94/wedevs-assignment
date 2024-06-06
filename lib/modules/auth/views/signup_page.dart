import 'package:dokan/app/routes.dart';
import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:dokan/modules/auth/views/login_page.dart';
import 'package:dokan/modules/auth/widget/dokan_icon_button.dart';
import 'package:dokan/modules/auth/widget/dokan_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> {

  final AuthController authController = Get.find<AuthController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  
  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 40.w,
                      width: 40.w,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: Center(
                          child: DokanIcon.icon(DokanIcon.user, size: 30.sp, color: const Color(0xFF7C8592)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 12.w, width: 12.w,
                          alignment: Alignment.center,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(6.w),
                            gradient:  const LinearGradient(
                              colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
                            ),
                          ),
                          child: DokanIcon.icon(DokanIcon.camera, size: 12.sp, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),

              DokanTextField(
                controller: usernameController,
                icon: DokanIcon.icon(DokanIcon.user, size: 18.sp, color: const Color(0xFF7C8592)),
                hint: "Name",
                isPassword: false,
                eyeVisibility: false,
              ),
              DokanTextField(
                controller: emailController,
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
                eyeVisibility: false,
              ),
              DokanTextField(
                controller: confirmPasswordController,
                icon: DokanIcon.icon(DokanIcon.lock, size: 17.sp, color: const Color(0xFF7C8592)),
                hint: "Confirm Password",
                isPassword: true,
                eyeVisibility: false,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 7.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 3.5.h, vertical: 0),
                child: CupertinoButton(
                    onPressed: () async{



                    },
                    color: const Color(0xFFF75F55),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    )),
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
      ),
    );
  }
}