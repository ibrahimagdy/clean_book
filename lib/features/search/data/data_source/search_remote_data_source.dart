import 'package:bookly_app/core/network/api_service.dart';

import '../../../home/data/data_source/home_remote_data_source.dart';
import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource{
  Future<List<BookEntity>> fetchSearchResult({required String subject});

}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{
  final ApiService apiService;
  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchSearchResult({required String subject}) async {
    var data = await apiService.getRequest(endpoint: 'volumes?Filtering=free-ebooks&q=subject:$subject');
    List<BookEntity> books = getBookList(data);
    return books;
  }
}