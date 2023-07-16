import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 5.h),
        TextField(
          style: TextStyle(
            color: Colors.black,
          ),
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(5).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(5).r,
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
