import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constance.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks({int pageNumber=0});
  List<BookEntity> fetchNewsBooks();


}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  
  
  @override
  List<BookEntity> fetchFeatureBooks({int pageNumber=0}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber+1)*10;
   var box=Hive.box<BookEntity>(featuredBooks);
   int length=box.values.length;
   if(startIndex>=length ||endIndex>startIndex){
    return [];
   }
   return box.values.toList().sublist(startIndex,endIndex);

  }

  @override
  List<BookEntity> fetchNewsBooks() {
    var box=Hive.box<BookEntity>(newestBooks);
    return box.values.toList();
  }
}
