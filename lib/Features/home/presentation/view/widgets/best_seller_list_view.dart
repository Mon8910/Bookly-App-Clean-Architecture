import 'package:bookly_app/Features/home/presentation/view/widgets/best_seller_view.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 10,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BestSellerView(),
            );
          })),
    );
  }
}
