import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.similarBooksUseCase)
      : super(FetchSimilarBooksInitial());

  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(FetchSimilarBooksLoading());
    var result = await similarBooksUseCase.call(category);
    result.fold(
      (failure) {
        emit(FetchSimilarBooksFailure(failure.errMessage));
      },
      (books) {
        emit(FetchSimilarBooksSuccess(books));
      },
    );
  }
}
