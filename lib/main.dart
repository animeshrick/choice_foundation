import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/view/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        allowFontScaling: false,
        designSize: Size(360, 690),
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: Dashboard(), //gtgt
            ));
  }
}
