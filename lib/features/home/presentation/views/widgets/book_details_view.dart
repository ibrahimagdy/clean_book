import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity bookEntity;

  const BookDetailsView({
    super.key,
    required this.bookEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    const BookDetailsAppBar(),
                    SizedBox(height: 13.h),
                    BooksDetailsSection(bookEntity: bookEntity),
                    Expanded(child: SizedBox(height: 50.h)),
                    SimilarBooksSection(
                      bookEntity: bookEntity,
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
