import 'package:bookly_app/Features/home/presentation/view/widgets/best_seller_view.dart';
import 'package:flutter/material.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: ((context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BestSellerView(),
          );
        }));
  }
}
