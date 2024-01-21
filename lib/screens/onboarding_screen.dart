import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../globals.dart';
import '../theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    await introBox!.put('isIntroduced', true);
    debugPrint('box: ${introBox!.get('isIntroduced')}');
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: IntroductionScreen(
        key: introKey,
        curve: Curves.fastLinearToSlowEaseIn,
        globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        showSkipButton: true,
        onSkip: () => _onIntroEnd(context),
        skip: Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        skipOrBackFlex: 0,
        showDoneButton: true,
        onDone: () => _onIntroEnd(context),
        done: Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        showNextButton: true,
        next: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).primaryColor,
        ),
        nextFlex: 0,
        controlsPadding: const EdgeInsets.all(20),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          color: AppTheme.isDark
              ? Theme.of(context).canvasColor
              : FlavorConfig.instance.variables['appGrey'],
          activeSize: const Size(24, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        pages: [
          PageViewModel(
            title: 'Welcome to AI-Hunter',
            body:
                'Unlock the potential of AI with AI-Hunter, the definitive directory for AI tools. Our extensive library spans over 2000 tools across more than 70 categories, equipping you with the means to innovate and enhance your projects.',
            image: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/onboarding/intro-placeholder.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: PageDecoration(
              bodyFlex: 0,
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              bodyTextStyle: TextStyle(
                color: AppTheme.isDark
                    ? Colors.white
                    : FlavorConfig.instance.variables['appDarkGrey'],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              imagePadding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
            ),
          ),
          PageViewModel(
            image: Image.asset(
              'assets/images/onboarding/intro-placeholder.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            title: 'Tailored For Excellence',
            body:
                'Explore detailed reviews, pricing, and alternatives for each AI tool. Our directory is constantly updated, ensuring you have access to the latest in AI technology',
            decoration: PageDecoration(
              fullScreen: true,
              bodyFlex: 0,
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              bodyTextStyle: TextStyle(
                color: AppTheme.isDark
                    ? Colors.white
                    : FlavorConfig.instance.variables['appDarkGrey'],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              bodyPadding: const EdgeInsets.all(20),
              contentMargin: const EdgeInsets.all(20),
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
            ),
          ),
          PageViewModel(
            reverse: true,
            title: 'Join Our Community',
            body:
                'Become part of a vibrant community of AI enthusiasts. Share, learn, and stay updated with weekly insights into the AI world. Start with AI-Hunter today and step into the future.',
            image: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/onboarding/intro-placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: PageDecoration(
              bodyFlex: 0,
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              bodyTextStyle: TextStyle(
                color: AppTheme.isDark
                    ? Colors.white
                    : FlavorConfig.instance.variables['appDarkGrey'],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              titlePadding: const EdgeInsets.only(top: 60),
              imagePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
          ),
        ],
      ),
    );
  }
}
