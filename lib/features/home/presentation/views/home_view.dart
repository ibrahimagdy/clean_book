import 'package:bookly_app/core/di/dependency_injection.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/view_model/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/use_cases/fetch_featured_books_use_case.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.h),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(),
                    SizedBox(height: 23.h),
                    BlocProvider(
                      create: (context) => FetchFeaturedBooksCubit(
                        FetchFeaturedBooksUseCase(
                          getIt.get<HomeRepoImpl>(),
                        ),
                      )..fetchFeaturedBooks(),
                      child: const FeaturedBooksBlocConsumer(),
                    ),
                    SizedBox(height: 49.h),
                    Text(
                      'Newest Books',
                      style: TextStyles.font18SemiBold,
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => FetchNewestBooksCubit(
                  FetchNewestBooksUseCase(
                    getIt.get<HomeRepoImpl>(),
                  ),
                )..fetchNewestBooks(),
                child: const NewestBooksListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
