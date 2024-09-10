import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class BookItemImage extends StatelessWidget {
  const BookItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: NetworkImage(Assets.testImage),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
