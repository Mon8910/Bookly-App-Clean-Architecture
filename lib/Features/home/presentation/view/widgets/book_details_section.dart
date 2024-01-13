import 'package:bookly_app/Features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/custom_app_bar_book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomAppBarBookDetailsView(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: const CustomBookImage(image: '',),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('book gamed gdn ',
            style: Styles.titleStyle30.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            'ayman mohamed ',
            style: Styles.titleStyle16.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 30,
        ),
        const BooksAction(),
      ],
    );
  }
}
