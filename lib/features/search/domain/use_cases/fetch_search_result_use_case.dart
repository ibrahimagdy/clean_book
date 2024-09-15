import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/use_case.dart';

class FetchSearchResultUseCase extends UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;
  FetchSearchResultUseCase(this.searchRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([String? param]) async {
    if (param != null) {
      return await searchRepo.fetchSearchResult(subject: param);
    } else {
      return left(ServiceFailure('Subject cannot be null'));
    }
  }
}
