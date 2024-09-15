import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks({required String category});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks({required String category}) {
    var box = Hive.box<BookEntity>(kSimilarBox);
    return box.values.toList();
  }
}
