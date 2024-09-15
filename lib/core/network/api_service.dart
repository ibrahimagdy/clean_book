import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio;
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService(this._dio);

  Future<Map<String,dynamic>> getRequest({required String endpoint}) async{
    var response = await _dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}