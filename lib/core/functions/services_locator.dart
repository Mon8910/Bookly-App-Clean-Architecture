import 'package:bookly_app/Features/home/data/data_source/local_data_source/home_remote_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;
void saveLocator() {
  getIt.registerSingleton(ApiServices(
        Dio(),
      ),);
  getIt.registerSingleton<HomeRepoImpl>
  (HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteDataSourceImpl(
      getIt.get<ApiServices>()
    ),
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  ));
}
