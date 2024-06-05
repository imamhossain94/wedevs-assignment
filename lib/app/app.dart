import 'package:dokan/modules/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dokan/app/routes.dart';
import 'package:dokan/app/bindings/initial_binding.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.pages,
          theme: ThemeData(
            fontFamily: 'Roboto',
          ),
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
