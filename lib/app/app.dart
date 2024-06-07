import 'package:dokan/modules/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dokan/app/routes.dart';
import 'package:dokan/app/bindings/initial_binding.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        //designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          initialRoute: AppPages.INITIAL,
          initialBinding: InitialBinding(),
          getPages: AppPages.pages,
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'Roboto',
          ),
          debugShowCheckedModeBanner: false,
          home: widget,
        );
      }
    );
  }
}
