import 'package:bookly_app/Features/splash/prsesntation/view/widgets/sliding_text.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initAnimation(); // very important
    navigatToHome();

    super.initState();
  }

  void navigatToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(() => const HomeView(),
      //     transition: Transition.fadeIn, duration: kTransication);
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward(); // very important
    // slidingAnimation.addListener(() {
    //   setState(() {

    // });
    // });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 3,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
