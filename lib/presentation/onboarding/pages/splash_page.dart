import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workmate/common/background/gradient_background.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/pages/sign_in_page.dart';
import 'package:workmate/presentation/auth/signup/pages/sign_up_page.dart';
import 'package:workmate/presentation/onboarding/bloc/cubit/onboarding_cubit.dart';
import 'package:workmate/presentation/onboarding/pages/onboarding_1.dart';
import 'package:workmate/presentation/onboarding/pages/onboarding_2.dart';
import 'package:workmate/presentation/onboarding/pages/onboarding_3.dart';
import 'package:workmate/presentation/onboarding/pages/onboarding_4.dart';
import 'package:workmate/presentation/onboarding/widgets/next_button.dart';
import 'package:workmate/presentation/onboarding/widgets/skip_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _controller = PageController();

  void _onSkip() => _controller.jumpToPage(3);

  void _onNext() => _controller.nextPage(
      duration: const Duration(milliseconds: 150), curve: Curves.easeIn);
  void _navigateSignin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  void _navigateSignup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final pageIndex = _controller.page?.round() ?? 0;
      context.read<OnboardingCubit>().updateIndex(pageIndex);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Onboarding1(),
                Onboarding2(),
                Onboarding3(),
                Onboarding4()
              ],
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: SlideEffect(
                      spacing: 8.0,
                      radius: 8.0,
                      dotWidth: 40.0,
                      dotHeight: 8.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: AppColors.primaryColor,
                    ),
                    onDotClicked: (index) => _controller.animateToPage(
                      index,
                      duration: const Duration(microseconds: 150),
                      curve: Curves.easeIn,
                    ),
                  ),
                  const SizedBox(height: 30),
                  NextButton(
                    title: "Next",
                    onTap: _onNext,
                    onIndexChange: _navigateSignin,
                  ),
                  const SizedBox(height: 13),
                  SkipButton(
                    title: "Skip",
                    onTap: _onSkip,
                    onIndexChange: _navigateSignup,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
