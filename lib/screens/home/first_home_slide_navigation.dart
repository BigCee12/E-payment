//import 'package:epaymment/screens/auth/signin_user.dart';
import 'package:epaymment/screens/dashboard/home/home_dashboard.dart';
import 'package:epaymment/screens/home/second_home_slide_navigation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSlideScreen extends StatefulWidget {
  const HomeSlideScreen({Key? key}) : super(key: key);

  @override
  HomeSlideScreenState createState() => HomeSlideScreenState();
}

class HomeSlideScreenState extends State<HomeSlideScreen> {
  final PageController _pageController = PageController();
  final int _totalPages = 2; // Total number of pages
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.transparentBG,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _totalPages,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // First Page
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/first_ig.png',
                          height: 400,
                        ),
                        const SizedBox(height: 60),
                        const Center(
                          child: Text(
                            'The fastest transaction \nprocess on here',
                            style: TextStyle(
                              fontSize: 30,
                              color: CustomColors.elevatedButtons,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Get easy to pay all your bills with just a few steps.\n Paying your bills become fast and efficient',
                          style: TextStyle(
                            fontSize: 15,
                            color: CustomColors.firstSlideTextColors,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  // For all other pages (index 1 and beyond)
                  return const SecondHomeSlideScreen();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: SmoothPageIndicator(
              controller: _pageController,
              count: _totalPages,
              effect: const ExpandingDotsEffect(),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: CustomColors.elevatedButtons,
              ),
              onPressed: () {
                if (_currentPage == 0) {
                  // Navigate to the next page (page 2)
                  _pageController.animateToPage(
                    1, // Index of the page you want to navigate to
                    duration:
                        const Duration(milliseconds: 400), // Animation duration
                    curve: Curves.easeInOut, // Animation curve
                  );
                } else if (_currentPage == 1) {
                  // Navigate to the LoginScreen page (or perform any other action)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeDashboard(),
                    ),
                  );
                }
              },
              child: Text(
                _currentPage == 0 ? 'Get Started' : 'Next',
                style: GoogleFonts.boogaloo(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
