import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/login_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      descriptionPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,

          globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () => _onIntroEnd(context),
              child: const Text(
                'Lets go right away!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          pages: [
            PageViewModel(
              title: 'Online Learning Platform',
              body:
                  // ignore: lines_longer_than_80_chars
                  'Choose from 100,000 online video courses with new additions published',
              image: Lottie.asset('assets/lotties/intro1.json'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: 'Fractional shares',
              body: 'Instead of having to buy an entire share.',
              image: Lottie.asset('assets/lotties/intro2.json'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: 'Fractional shares',
              body: 'Instead of having to buy an entire share.',
              image: Lottie.asset('assets/lotties/intro3.json'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12)
              : const EdgeInsets.fromLTRB(8, 4, 8, 4),
          dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
        ),
      ),
    );
  }
}
