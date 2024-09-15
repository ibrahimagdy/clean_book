import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failures,List<BookEntity>>>fetchSearchResult({required String subject});
}