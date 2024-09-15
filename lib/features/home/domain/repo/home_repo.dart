import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failures,List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0});
  Future<Either<Failures,List<BookEntity>>> fetchNewestBooks();
  Future<Either<Failures,List<BookEntity>>> fetchSimilarBooks({required String category});
}
