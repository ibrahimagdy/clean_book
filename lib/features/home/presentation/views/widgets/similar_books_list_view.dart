import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_model/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'book_item_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
      builder: (context, state) {
        if (state is FetchSimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: BookItemImage(
                    imageUrl: state.books[index].image!,
                    bookEntity: state.books[index],
                  ),
                );
              },
            ),
          );
        } else if (state is FetchSimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
