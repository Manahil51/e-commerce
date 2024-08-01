import 'dart:async';

import 'package:ecommerce_app/views/screens/loginandregister/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<OnboardingPageModel> pages = [
    OnboardingPageModel(
      'Choose Product',
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      'onboarding1.png',
    ),
    OnboardingPageModel(
      'Make your Payment',
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      'onboarding2.png',
    ),
    OnboardingPageModel(
      'Get Your Order',
      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
      'onboarding3.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < pages.length - 1) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return OnboardingPageItem(
            pageModel: pages[index],
            onPageFinished: () {
              _timer?.cancel();
              if (index == pages.length - 1) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class OnboardingPageItem extends StatelessWidget {
  final OnboardingPageModel pageModel;
  final VoidCallback onPageFinished;

  const OnboardingPageItem({
    required this.pageModel,
    required this.onPageFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pageModel.imagePath,
            height: 300,
            width: 300,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 48.0),
          Text(
            pageModel.title,
            style: GoogleFonts.lato(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            pageModel.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPageModel(this.title, this.description, this.imagePath);
}
