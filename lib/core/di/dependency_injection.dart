import 'package:bookly_app/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/home_local_data_source.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/search/data/repo/search_repo_impl.dart';
import '../network/api_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
