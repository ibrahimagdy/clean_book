import 'package:bookly_app/core/routing/routes.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class NewestBookItem extends StatelessWidget {
  const NewestBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(Routes.details),
      child: Row(
        children: [
          Container(
            width: 83.w,
            height: 113.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(Assets.testImage),
              ),
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 196.w,
                  child: Text(
                    'Harry Potter and the Goblet of Fire',
                    style: TextStyles.font20Regular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'J.K. Rowling',
                  style: TextStyles.font14Regular,
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      '19.99 €',
                      style: TextStyles.font20Bold,
                    ),
                    SizedBox(width: 36.w),
                    const BookRating(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
