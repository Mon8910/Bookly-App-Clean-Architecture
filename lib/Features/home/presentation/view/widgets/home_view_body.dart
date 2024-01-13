import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/manger/cubit/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/fearure_book_list_view_loading.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/featured_book_list.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAPPBar(),
            FeatureBookListBlocBuilder(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Best Seller',
                style: Styles.titleStyle18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )),
        SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}

class FeatureBookListBlocBuilder extends StatefulWidget {
  const FeatureBookListBlocBuilder({
    super.key,
  });

  @override
  State<FeatureBookListBlocBuilder> createState() =>
      _FeatureBookListBlocBuilderState();
}

class _FeatureBookListBlocBuilderState
    extends State<FeatureBookListBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBookCubit, FeatureBookState>(
      listener: (context, state) {
        if (state is FeatureBookSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        
        if (state is FeatureBookSuccess ||
            state is FeatureBookLoadingPagination ||
            state is FeatureBookFailurePagination) {
          return FeaturedBookList(
            books: books,
          );
        } else if (state is FeatureBookFailure) {
          return Text(state.message);
        } else {
          return const FeatureBookListViewLoading();
        }
      },
    );
  }
}
