part of 'fetch_similar_books_cubit.dart';

sealed class FetchSimilarBooksState {}

final class FetchSimilarBooksInitial extends FetchSimilarBooksState {}
final class FetchSimilarBooksLoading extends FetchSimilarBooksState {}
final class FetchSimilarBooksSuccess extends FetchSimilarBooksState {
  final List<BookEntity> books;
  FetchSimilarBooksSuccess(this.books);
}
final class FetchSimilarBooksFailure extends FetchSimilarBooksState {
  final String errMessage;
  FetchSimilarBooksFailure(this.errMessage);
}
