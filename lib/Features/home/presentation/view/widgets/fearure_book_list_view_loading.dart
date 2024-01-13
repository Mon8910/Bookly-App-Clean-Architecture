import 'package:bookly_app/Features/home/presentation/view/widgets/custom_book_image_loading.dart';
import 'package:bookly_app/core/widgets/custom_animation_widget.dart';
import 'package:flutter/material.dart';

class FeatureBookListViewLoading extends StatelessWidget{
  const FeatureBookListViewLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomAnimationWidgets(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
           
            scrollDirection: Axis.horizontal,
            itemCount: 15,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomBookImageLoading(
                  
                ),
              );
            }),
      ),
    );
  }
}