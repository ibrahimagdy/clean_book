import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_item_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
    required ScrollController scrollController,
    required this.books,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: BookItemImage(
              imageUrl: books[index].image!,
              bookEntity: books[index],
            ),
          );
        },
      ),
    );
  }
}
