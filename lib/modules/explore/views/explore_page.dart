
import 'package:dokan/modules/explore/controllers/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExplorePage extends GetView<ExploreController> {
  const ExplorePage({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Explore",
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
        body: const Center(
          child: Text('Explore Page'),
        ),
      ),
    );
  }
}
