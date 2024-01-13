import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/usecase/fetch_feature_books_usecase.dart';
import 'package:meta/meta.dart';

part 'feature_book_state.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit(this.featureBooksUsecase) : super(FeatureBookInitial());
  final FetchFeatureBooksUsecase featureBooksUsecase;

  Future<void> fetchFeatureBook({int pageNumber = 0}) async {
    if (pageNumber==0) {
  emit(FeatureBookLoading());
}else{
  emit(FeatureBookLoadingPagination());
}
    var result = await featureBooksUsecase.call(pageNumber);
    result.fold((failure)  {
      if(pageNumber==0){
        emit(FeatureBookFailure(failure.message));

      }else{
        emit(FeatureBookFailurePagination(failure.message));
      }
      },
        (books) {
      emit(FeatureBookSuccess(books));
    });
  }
}
