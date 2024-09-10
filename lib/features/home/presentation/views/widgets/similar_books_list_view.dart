import 'package:flutter/material.dart';
import 'book_item_image.dart';

class SimilarBooksListView extends StatelessWidget{
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const BookItemImage();
        },
      ),
    );
  }
}