import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarBookDetailsView extends StatelessWidget {
  const CustomAppBarBookDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop(AppRouter.kHomeView);
          },
          icon: const Icon(Icons.close),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
    );
  }
}
