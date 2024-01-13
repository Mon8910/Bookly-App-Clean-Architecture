import 'package:bookly_app/Features/home/presentation/view/widgets/similar_book_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookSimilarSection extends StatelessWidget {
  const BookSimilarSection({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            ' you can read also',
            style: Styles.titleStyle20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SimilarBookListView(),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
