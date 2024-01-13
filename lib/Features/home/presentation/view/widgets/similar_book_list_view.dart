import 'package:bookly_app/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, builder) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomBookImage(image: '',),
            );
          }),
    );
  }
}
