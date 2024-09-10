import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xFFFFDD4F),
        ),
        SizedBox(width: 3.w),
        Text(
          '4.8',
          style: TextStyles.font16Regular,
        ),
        SizedBox(width: 6.w),
        Text(
          '(2390)',
          style: TextStyles.font14Regular,
        ),
      ],
    );
  }
}
