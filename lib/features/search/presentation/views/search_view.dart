import 'package:bookly_app/core/di/dependency_injection.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/features/search/domain/repo/search_repo.dart';
import 'package:bookly_app/features/search/domain/use_cases/fetch_search_result_use_case.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_result_cubit/search_result_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchResultCubit(
        FetchSearchResultUseCase(
          getIt.get<SearchRepoImpl>(),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                const CustomTextField(),
                SizedBox(height: 18.h),
                Text(
                  'Search Result',
                  style: TextStyles.font16Regular,
                ),
                SizedBox(height: 12.h),
                const Expanded(child: SearchResultListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
