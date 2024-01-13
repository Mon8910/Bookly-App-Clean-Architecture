import 'package:bookly_app/Features/home/presentation/view/widgets/book_details_section.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/book_similar_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                BookSimilarSection()
              ],
            ),
          ),
        )
      ],
    );
  }
}
