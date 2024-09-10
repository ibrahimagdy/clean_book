import 'package:bookly_app/features/home/presentation/views/widgets/books_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';
import 'book_item_image.dart';
import 'book_rating.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.22),
          child: const BookItemImage(),
        ),
        SizedBox(height: 25.h),
        Text(
          'The Jungle Book',
          style: TextStyles.font30Regular,
        ),
        SizedBox(height: 5.h),
        Text(
          'Rudyard Kipling',
          style: TextStyles.font18Regular,
        ),
        SizedBox(height: 5.h),
        const BookRating(),
        SizedBox(height: 40.h),
        const BooksActionButton(),
      ],
    );
  }
}
