part of 'feature_book_cubit.dart';

@immutable
sealed class FeatureBookState {}

final class FeatureBookInitial extends FeatureBookState {}
final class FeatureBookLoadingPagination extends FeatureBookState {}


final class FeatureBookLoading extends FeatureBookState {}
final class FeatureBookFailure extends FeatureBookState {
  final String message;

  FeatureBookFailure(this.message);

}
final class FeatureBookFailurePagination extends FeatureBookState {
  final String message;

  FeatureBookFailurePagination(this.message);

  

}
final class FeatureBookSuccess extends FeatureBookState {
  final List<BookEntity> books;

  FeatureBookSuccess(this.books);

}


