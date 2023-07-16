import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'SUCCESS LOGIN',
        style: TextStyle(
          fontSize: 30.sp,
          color: Colors.blue,
        ),
      )),
    );
  }
}
