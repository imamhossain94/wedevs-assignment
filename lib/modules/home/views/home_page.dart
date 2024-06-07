import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:dokan/modules/home/models/filter_option.dart';
import 'package:dokan/modules/home/widget/dokan_product_card.dart';
import 'package:dokan/modules/home/widget/filter_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/home/controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Product List",
              style: TextStyle(
                  color: const Color(0xFF222455),
                  fontSize: 22.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: IconButton(
                  icon: DokanIcon.icon(DokanIcon.search, size: 20.sp),
                  onPressed: () {},
                ),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                height: 50.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 4), // changes position of shadow
                      ),
                    ]),
                child: Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          showFilterModal(
                            context,
                            onValueChanged: (FilterOption value) {
                              controller.selectedFilterOption.value = value;
                            },
                            onApply: () {
                              controller.applyFilter(controller.selectedFilterOption.value);
                              Get.back();
                            },
                            onCancel: () => Get.back(),
                          );
                        },
                        icon: DokanIcon.icon(DokanIcon.setting,
                            size: 16.sp, color: const Color(0xFFB6BED4)),
                        label: Text(
                          "Filters",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: "Lato",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal),
                        )),
                    const Spacer(),
                    DropdownButton<String>(
                        value: "Sort by",
                        icon: Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: DokanIcon.icon(DokanIcon.arrowDown,
                              size: 14.sp, color: const Color(0xFFB6BED4)),
                        ),
                        //iconSize: 42,
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {},
                        items: <String>[
                          'Sort by',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: "Lato",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        }).toList()),
                    IconButton(
                      icon: DokanIcon.icon(DokanIcon.listBullet,
                          size: 16.sp, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (controller.filteredProducts.isEmpty) {
                      return const Center(
                        child: Text('No products available.'),
                      );
                    } else {
                      return GridView.builder(
                        itemCount: controller.filteredProducts.length,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (1 / 1.626),
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.w,
                        ),
                        itemBuilder: (context, index) {
                          final product = controller.filteredProducts[index];
                          return ProductCard(product: product);
                        },
                      );
                    }
                  }),
                ),
              ),
            ],
          )),
    );
  }
}
