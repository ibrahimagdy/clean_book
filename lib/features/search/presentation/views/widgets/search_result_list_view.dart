import 'package:bookly_app/core/widgets/loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_result_cubit/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../home/presentation/views/widgets/newest_book_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchResultCubit, SearchResultState>(
      builder: (context, state) {
        if (state is SearchResultSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: NewestBookItem(
                  bookEntity: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchResultFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if(state is SearchResultInitial){
          return const CustomErrorWidget(errMessage: 'Start To Search');
        }
        else{
          return const LoadingIndicator();
        }
      },
    );
  }
}
