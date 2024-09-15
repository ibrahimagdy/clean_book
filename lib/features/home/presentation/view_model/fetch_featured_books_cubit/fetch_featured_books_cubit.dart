import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.featuredBooksUseCase)
      : super(FetchFeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FetchFeaturedBooksLoading());
    }
    else{
      emit(FetchFeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FetchFeaturedBooksFailure(failure.errMessage));
        }
        else{
          emit(FetchFeaturedBooksPaginationFailure(failure.errMessage));
        }
      },
      (books) {
        emit(FetchFeaturedBooksSuccess(books));
      },
    );
  }
}
