part of 'news_books_cubit.dart';

@immutable
sealed class NewsBooksState {}

final class NewsBooksInitial extends NewsBooksState {}

final class NewsBooksLoading extends NewsBooksState {}

final class NewsBooksFailure extends NewsBooksState {
  final String message;

  NewsBooksFailure(this.message);
}

final class NewsBooksSuccess extends NewsBooksState {
  final List<BookEntity> bookas;

  NewsBooksSuccess(this.bookas);
}
