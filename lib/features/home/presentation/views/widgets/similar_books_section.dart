import 'package:bookly_app/core/di/dependency_injection.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/view_model/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooksSection extends StatelessWidget {
  final BookEntity bookEntity;
  const SimilarBooksSection({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    final category = bookEntity.bookId;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: TextStyles.font14Regular.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 14.h),
        BlocProvider(
          create: (context) => FetchSimilarBooksCubit(
            FetchSimilarBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchSimilarBooks(category: category),
          child: const SimilarBooksListView(),
        ),
      ],
    );
  }
}
