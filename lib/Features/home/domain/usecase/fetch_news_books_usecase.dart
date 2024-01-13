import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repos.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/usecas/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchNewsBooksUsecase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepos homeRepos;

  FetchNewsBooksUsecase(this.homeRepos);
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepos.fetchNewsBooks();
  }
}
