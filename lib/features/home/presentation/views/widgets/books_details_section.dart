import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';
import 'book_item_image.dart';
import 'book_rating.dart';

class BooksDetailsSection extends StatelessWidget {
  final BookEntity bookEntity;

  const BooksDetailsSection({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.22),
          child: BookItemImage(
            imageUrl: bookEntity.image ?? Assets.testImage,
            bookEntity: bookEntity,
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          bookEntity.title,
          style: TextStyles.font30Regular,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.h),
        Text(
          bookEntity.authorName ?? '',
          style: TextStyles.font18Regular,
        ),
        SizedBox(height: 5.h),
        BookRating(
          rating: bookEntity.rating ?? 0,
          count: bookEntity.count ?? 0,
        ),
        SizedBox(height: 40.h),
        BooksActionButton(bookEntity:bookEntity),
      ],
    );
  }
}
