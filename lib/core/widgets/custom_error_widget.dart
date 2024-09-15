import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMessage;

  const CustomErrorWidget({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Center(
        child: Text(
          errMessage,
          style: TextStyles.font14Regular.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}