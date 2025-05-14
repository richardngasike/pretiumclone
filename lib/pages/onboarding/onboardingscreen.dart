import 'package:flutter/material.dart';
import 'package:pretium/pages/authscreens/loginscreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardData> _onboardPages = [
    OnboardData(
      image: Icons.credit_card,
      title: "Direct Pay",
      description: "Pay with crypto across Africa effortlessly",
    ),
    OnboardData(
      image: Icons.account_balance_wallet,
      title: "Accept Payments",
      description: "Accept stablecoin payments hassle-free",
    ),
    OnboardData(
      image: Icons.receipt_long,
      title: "Pay Bills",
      description: "Pay for utility services and earn rewards",
    ),
  ];

  void _nextPage() {
    if (_currentPage < _onboardPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _onboardPages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final page = _onboardPages[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.teal[20], // Lighter teal
                          child: Icon(
                            page.image,
                            size: 80,
                            color: Colors.teal[800], // Original icon color
                          ),
                        ),
                        SizedBox(height: 40),
                        Text(
                          page.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _onboardPages.length,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: _currentPage == index ? 18 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color:
                                    _currentPage == index
                                        ? Colors.teal
                                        : Colors.teal[100],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed:
                              _currentPage == _onboardPages.length - 1
                                  ? () {
                                    // Navigate to sign in screen
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ),
                                    );
                                  }
                                  : _nextPage,
                          child: Text(
                            _currentPage == _onboardPages.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // Skip to sign in screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardData {
  final IconData image;
  final String title;
  final String description;

  OnboardData({
    required this.image,
    required this.title,
    required this.description,
  });
}
