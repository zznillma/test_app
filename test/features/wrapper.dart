import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget wrapApp(Widget app) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    splitScreenMode: true,
    builder: (context, child) => (MaterialApp(
      home: app,
    )),
  );
}