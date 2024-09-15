import 'package:bookly_app/features/search/domain/use_cases/fetch_search_result_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/domain/entities/book_entity.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit(this.searchResultUseCase) : super(SearchResultInitial());

  final FetchSearchResultUseCase searchResultUseCase;

  Future<void> fetchSearchResult({required String subject}) async {
    emit(SearchResultInitial());
    emit(SearchResultLoading());
    var result = await searchResultUseCase.call(subject);

    result.fold(
      (failure) {
        emit(SearchResultFailure(failure.errMessage));
      },
      (books) {
        emit(SearchResultSuccess(books));
      },
    );
  }
}
