import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  final num rating;
  final int count;
  const BookRating({super.key, required this.rating, required this.count});

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
          rating.toString(),
          style: TextStyles.font16Regular,
        ),
        SizedBox(width: 6.w),
        Text(
          '($count)',
          style: TextStyles.font14Regular,
        ),
      ],
    );
  }
}
