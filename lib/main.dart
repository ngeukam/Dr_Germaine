import 'dart:async';
import 'package:dr_germaine_app/screens/splash_message.dart';
import 'package:dr_germaine_app/screens/splash_notification.dart';
import 'package:dr_germaine_app/screens/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreenSlider(), // HomePage is the entry point
    );
  }
}

class SplashScreenSlider extends StatefulWidget {
  const SplashScreenSlider({super.key});

  @override
  _SplashScreenSliderState createState() => _SplashScreenSliderState();
}

class _SplashScreenSliderState extends State<SplashScreenSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Automatic scrolling
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Loop back to the first page
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(microseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              SplashMessagePage(),
              SplashNotificationPage(),
            ],
          ),
          // Dots and Button
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Page Indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 2, // Number of pages
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                // Show "Continuer" button only on the second page
                if (_currentPage == 1) // Show button only on the second page
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to another page or perform an action
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage(), // Replace with your next screen
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Button background color
                      foregroundColor: Colors.white, // Button text color
                      side: const BorderSide( // Add a white border
                        color: Colors.white,
                        width: 2.0, // Adjust border width
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      "Continuer",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
