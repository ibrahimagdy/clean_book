import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.newestBooksUseCase)
      : super(FetchNewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());

    var result = await newestBooksUseCase.call();

    result.fold(
      (failure) {
        emit(FetchNewestBooksFailure(failure.errMessage));
      },
      (books) {
        emit(FetchNewestBooksSuccess(books));
      },
    );
  }
}
