import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/url_launcher.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksActionButton extends StatelessWidget {
  final BookEntity bookEntity;
  const BooksActionButton({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.h),
      child:  Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              text: 'Free',
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                urlLauncher(context, bookEntity.previewLink);
              },
              backgroundColor: const Color(0xFFEF8262),
              text: 'Preview',
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
