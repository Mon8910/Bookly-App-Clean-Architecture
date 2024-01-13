import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/usecase/fetch_news_books_usecase.dart';
import 'package:meta/meta.dart';

part 'news_books_state.dart';

class NewsBooksCubit extends Cubit<NewsBooksState> {
  NewsBooksCubit(this.fetchNewsBooksUsecase) : super(NewsBooksInitial());
  final FetchNewsBooksUsecase fetchNewsBooksUsecase;

  Future<void> fetchNewsBooks() async {
    emit(NewsBooksLoading());
    var result = await fetchNewsBooksUsecase.call();
    result.fold((l) {
      NewsBooksFailure(l.message);
    }, (books) {
      NewsBooksSuccess(books);
    });
  }
}
