import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/use_case.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;
  FetchSimilarBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([String? param]) async {
    if (param != null) {
      return await homeRepo.fetchSimilarBooks(category: param);
    } else {
      return left(ServiceFailure('Category cannot be null'));
    }
  }
}
