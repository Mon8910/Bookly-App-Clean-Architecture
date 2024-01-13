import 'package:bookly_app/Features/home/data/data_source/local_data_source/home_remote_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_source/remote_data_source/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repos.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepos {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeatureBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books =
          await homeRemoteDataSource.fetchFeatureBooks(pageNumer: pageNumber);
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewsBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsBooks();
      return right(books);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}
