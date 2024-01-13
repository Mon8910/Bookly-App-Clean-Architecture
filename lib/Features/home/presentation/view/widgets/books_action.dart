import 'package:bookly_app/core/utils/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
              backGroundColor: Colors.white,
              text: '19.99',
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              textColor: Colors.black,
              fontSize: 20),
        ),
        Expanded(
            child: CustomButton(
                backGroundColor: Color(0xffEF8262),
                text: 'FreePreview',
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                textColor: Colors.white,
                fontSize: 18))
      ],
    );
  }
}
