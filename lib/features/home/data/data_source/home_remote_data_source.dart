import 'package:bookly_app/core/network/api_service.dart';
import 'package:bookly_app/core/utils/constants.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

import '../../../../core/helpers/save_data.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.getRequest(endpoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }



  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.getRequest(endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }
  
}

List<BookEntity> getBookList(Map<String,dynamic> data){
  List<BookEntity> books = [];
  for(var book in data['items']){
    books.add(BookModel.fromJson(book));
  }
  return books;
}