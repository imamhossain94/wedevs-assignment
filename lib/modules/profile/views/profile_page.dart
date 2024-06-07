import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:dokan/modules/profile/controllers/profile_controller.dart';
import 'package:dokan/modules/profile/widget/dokan_expansion_tile.dart';
import 'package:dokan/modules/profile/widget/dokan_form_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends GetView<ProfileController> {
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _aptSuiteBldgController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Account",
            style: TextStyle(
                color: const Color(0xFF222455),
                fontSize: 22.sp,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    radius: Radius.circular(65.w),
                    padding: EdgeInsets.all(2.w),
                    color: const Color(0xFFFFADAD),
                    dashPattern: const [6, 3],
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(65.w)),
                      child: Obx(() => Container(
                            height: 130.w,
                            width: 130.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: controller.user.value.id != null
                                        ? NetworkImage(controller
                                            .user.value.avatarUrls!["96"]!)
                                        : const AssetImage(
                                                "assets/img_profile.png")
                                            as ImageProvider,
                                    fit: BoxFit.fill)),
                          )),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.user.value.name ?? "Guest User",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: "Roboto",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => Text(
                    controller.user.value.email ?? "guest@example.com",
                    style: TextStyle(
                        color: const Color(0xFF535353),
                        fontSize: 18.sp,
                        fontFamily: "Lato",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal),
                  )),
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DokanExpansionTile(
                          title: "Account",
                          icon: DokanIcon.icon(DokanIcon.user),
                          children: [
                            DokanFormField(
                              title: "Email",
                              hint: "youremail@xmail.com",
                              controller: controller.emailController.value,
                            ),
                            DokanFormField(
                              title: "Full Name",
                              hint: "William Bennett",
                              controller: controller.fullNameController.value,
                            ),
                            DokanFormField(
                              title: "Street Address",
                              hint: "465 Nolan Causeway Suite 079",
                              controller: _streetAddressController,
                            ),
                            DokanFormField(
                              title: "Apt, Suite, Bldg (optional)",
                              hint: "Unit 512",
                              controller: _aptSuiteBldgController,
                            ),
                            DokanFormField(
                              title: "Zip Code",
                              hint: "77017",
                              controller: _zipCodeController,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.h, horizontal: 15.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              width: 0.5,
                                              color: Color(0xFFD2DBE0))),
                                      elevation: 0,
                                      child: SizedBox(
                                          height: 50.h,
                                          child: CupertinoButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              padding: EdgeInsets.zero,
                                              color: Colors.white,
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF818995),
                                                    fontSize: 14.sp,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                        height: 50.h,
                                        child: CupertinoButton(
                                            onPressed: () {
                                              final fullName = controller
                                                  .fullNameController
                                                  .value
                                                  .text;
                                              final names = fullName.split(' ');
                                              final firstName = names.isNotEmpty
                                                  ? names[0]
                                                  : '';
                                              final lastName = names.length > 1
                                                  ? names.sublist(1).join(' ')
                                                  : '';

                                              controller.updateUser(
                                                  controller.user.value.id!, {
                                                "first_name": firstName,
                                                "last_name": lastName,
                                              });
                                            },
                                            padding: EdgeInsets.zero,
                                            color: const Color(0xFF1ABC9C),
                                            child: Obx(() => controller
                                                    .isLoading.value
                                                ? SizedBox(
                                                    height: 15.w,
                                                    width: 15.w,
                                                    child: const CircularProgressIndicator(
                                                        strokeWidth: 1,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                Colors.white)))
                                                : Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                        fontFamily: "Lato",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        DokanExpansionTile(
                            title: "Passwords",
                            icon: DokanIcon.icon(DokanIcon.lock,
                                size: 14.sp, color: const Color(0xFF7C8592)),
                            children: const []),
                        DokanExpansionTile(
                            title: "Notification",
                            icon: DokanIcon.icon(DokanIcon.notificationBell,
                                size: 14.sp, color: const Color(0xFF7C8592)),
                            children: const []),
                        DokanExpansionTile(
                            title: "Wishlist(00)",
                            icon: DokanIcon.icon(DokanIcon.heart,
                                size: 14.sp, color: const Color(0xFF7C8592)),
                            children: const []),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
