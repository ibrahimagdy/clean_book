part of 'fetch_featured_books_cubit.dart';

sealed class FetchFeaturedBooksState {}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksPaginationLoading extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksPaginationFailure extends FetchFeaturedBooksState {
  final String errMessage;
  FetchFeaturedBooksPaginationFailure(this.errMessage);
}
final class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookEntity> books;
  FetchFeaturedBooksSuccess(this.books);
}
final class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errMessage;
  FetchFeaturedBooksFailure(this.errMessage);
}
