import 'package:bookly_app/Features/home/presentation/view/widgets/book_rating.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetails);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage(AssetsData.testImage),
                    )),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: const Text(
                      'Harry poter and the gobel fire  ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.titleStyle20,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    'ayman mohamed',
                    style: Styles.titleStyle14,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    children: [
                      Text(
                        '19.99',
                        style: Styles.titleStyle20,
                      ),
                      Spacer(),
                      BookRating()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
