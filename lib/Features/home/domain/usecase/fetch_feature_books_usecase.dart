import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repos.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/usecas/usecase.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBooksUsecase extends UseCase<List<BookEntity>, int> {
  final HomeRepos homeRepos;

  FetchFeatureBooksUsecase(this.homeRepos);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber=0]) async {
    return await homeRepos.fetchFeatureBooks(
      pageNumber: pageNumber
    );
  }
}
