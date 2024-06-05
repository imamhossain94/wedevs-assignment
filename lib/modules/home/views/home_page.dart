import 'package:dokan/core/utils/dokan_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dokan/modules/home/controllers/home_controller.dart';
import 'package:sizer/sizer.dart';

class HomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AppBar(
            title: Text(
              "Product List",
              style: TextStyle(
                  color: const Color(0xFF222455),
                  fontSize: 18.sp,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  icon: DokanIcon.icon(DokanIcon.search, size: 16.sp),
                  onPressed: () {},
                ),
              )
            ],
          )
        ]),
      ),
      body: Obx(() {
        if (controller.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text(product.description),
                trailing: Text('\$${product.price}'),
              );
            },
          );
        }
      }),
    );
  }
}
