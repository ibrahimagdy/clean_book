import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/view_model/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: state.books.length,
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: NewestBookItem(
                  bookEntity: state.books[index],
                ),
              ),
            ),
          );
        } else if (state is FetchNewestBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errMessage: state.errMessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: LoadingIndicator(),
          );
        }
      },
    );
  }
}
