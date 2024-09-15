import 'package:bookly_app/core/routing/routes.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/styles.dart';

class NewestBookItem extends StatelessWidget {
  final BookEntity bookEntity;

  const NewestBookItem({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(Routes.details, extra: bookEntity),
      child: Row(
        children: [
          SizedBox(
            width: 83.w,
            height: 113.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: bookEntity.image ?? Assets.testImage,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                  size: 28,
                ),
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
                    bookEntity.title,
                    style: TextStyles.font20Regular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  bookEntity.authorName!,
                  style: TextStyles.font14Regular,
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      'Free',
                      style: TextStyles.font20Bold,
                    ),
                    SizedBox(width: 50.w),
                    BookRating(
                      rating: bookEntity.rating ?? 0,
                      count: bookEntity.count ?? 0,
                    ),
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
