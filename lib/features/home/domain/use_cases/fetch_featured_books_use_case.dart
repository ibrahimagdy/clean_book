import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_case/use_case.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,NoParam>{
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([NoParam? param]) async{
    return await homeRepo.fetchFeaturedBooks();
  }
}