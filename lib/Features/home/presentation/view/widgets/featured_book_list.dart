import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manger/cubit/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookList extends StatefulWidget {
  const FeaturedBookList({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBookList> createState() => _FeaturedBookListState();
}

class _FeaturedBookListState extends State<FeaturedBookList> {
  late ScrollController _scrollController;
  var nextPage = 1;
  bool isloading=false;
  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
    _scrollController.addListener(_scrollListner);
  }

  void _scrollListner() async{
    var currentPosition = _scrollController.position.pixels;
    var maxPosition = _scrollController.position.maxScrollExtent;
    if (currentPosition >= .7* maxPosition) {
      if (!isloading) {
        isloading=true;
 await BlocProvider.of<FeatureBookCubit>(context)
      .fetchFeatureBook(pageNumber: nextPage++);
      isloading=false;
}
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomBookImage(
                image: widget.books[index].image ?? '',
              ),
            );
          }),
    );
  }
}
