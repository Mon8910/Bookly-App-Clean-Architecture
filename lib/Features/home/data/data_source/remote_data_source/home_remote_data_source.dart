import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constance.dart';
import 'package:bookly_app/core/functions/functions.dart';
import 'package:bookly_app/core/utils/api_services.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumer=0});
  Future<List<BookEntity>> fetchNewsBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumer=0}) async {
   var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumer*10}');

    List<BookEntity> books = getBooksList(data).toList() ;

    saveDataBox(books, featuredBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming&sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveDataBox(books, newestBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items'] ) {
      books.add(BookModel.fromJson(bookMap ));
    }
    return books;
  }
}
