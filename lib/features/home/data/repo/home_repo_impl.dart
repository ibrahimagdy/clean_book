import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks() async {
    try{
      var cachedBooks = homeLocalDataSource.fetchFeaturedBooks();
      if(cachedBooks.isNotEmpty){
        return right(cachedBooks);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    }
    catch(e){
      return left(ServiceFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() async {
    try{
      var cachedBooks = homeLocalDataSource.fetchNewestBooks();
      if(cachedBooks.isNotEmpty){
        return right(cachedBooks);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    }
    catch(e){
      if(e is DioException){
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks({required String category}) async {
    try {
      var cachedBooks = homeLocalDataSource.fetchSimilarBooks(
          category: category);
      if (cachedBooks.isNotEmpty) {
        return right(cachedBooks);
      }
      var books = await homeRemoteDataSource.fetchSimilarBooks(category: category);
      return right(books);
    }
    catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}
