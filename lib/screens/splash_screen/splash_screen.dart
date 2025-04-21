import 'package:flutter/material.dart';
import 'dart:async';

import 'package:test_hx_app/config/theme_constants.dart';
import 'package:test_hx_app/screens/auth_screen/email_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _firstHalfController;
  late Animation<Offset> _firstHalfOffset;
  late AnimationController _secondHalfController;
  late Animation<Offset> _secondHalfOffset;
  late AnimationController _pointsController;

  //initial logo and name
  bool _showName = false;
  bool _showLogoandNameCompleted = false;

  bool showSecondHalf = false;
  bool moveHeadingUp = false;
  bool showgetStartedButton = false;

  final List<Map> points = [
    {
      "icon": "splash_ic_1.png",
      "title": "Organize your finances in one place​"
    },
    {"icon": "splash_ic_2.png", "title": "Track your financial performance ​"},
    {"icon": "splash_ic_3.png", "title": "Plan your Financial future ​"},
    {"icon": "splash_ic_4.png", "title": "Security you can trust​"},
  ];

  @override
  void initState() {
    super.initState();
    // Delay to trigger the animation
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        // Move logo to the left
        _showName = false;
      });

      // Then delay before showing the name
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _showName = true;
        });
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showLogoandNameCompleted = true;
      });
      // First half animation
      _firstHalfController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      );
      _firstHalfOffset = Tween<Offset>(
        begin: const Offset(0, 1), // from top
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _firstHalfController,
        curve: Curves.easeOut,
      ));

      // Second half animation
      _secondHalfController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      );
      _secondHalfOffset = Tween<Offset>(
        begin: const Offset(0, 1), // from bottom
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _secondHalfController,
        curve: Curves.easeOut,
      ));

      // Points animation
      _pointsController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      );

      // Animation sequence
      _firstHalfController.forward();

      Timer(const Duration(milliseconds: 700), () {
        setState(() => showSecondHalf = true);
        _secondHalfController.forward();

        Timer(const Duration(milliseconds: 700), () {
          setState(() => moveHeadingUp = true);

          Timer(const Duration(milliseconds: 600), () {
            _pointsController.forward();
            Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                showgetStartedButton = true;
              });
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _firstHalfController.dispose();
    _secondHalfController.dispose();
    _pointsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double headingStartTop = MediaQuery.of(context).size.height / 2 - 40;
    double headingEndTop = 50;

    return Scaffold(
      backgroundColor: primaryColor,
      body: _showLogoandNameCompleted
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  Positioned(
                      top: 50,
                      child: Image.asset(
                        'assets/images/bg_logo.png',
                        height: 200,
                        width: 200,
                      )),
                  Positioned(
                      bottom: -10,
                      right: -10,
                      child: Image.asset(
                        'assets/images/bg_logo.png',
                        height: 200,
                        width: 200,
                      )),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    top: moveHeadingUp ? headingEndTop : headingStartTop,
                    left: 0,
                    right: 0,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SlideTransition(
                          position: _firstHalfOffset,
                          child: const Text(
                            "Take Control ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        showSecondHalf
                            ? SlideTransition(
                                position: _secondHalfOffset,
                                child: const Text(
                                  "of Your Wealth with Hoxton Wealth App​",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF9EEEE6)),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),

                  // Points animation
                  Positioned.fill(
                    top: headingEndTop + 160,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedBuilder(
                        animation: _pointsController,
                        builder: (context, child) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: points.asMap().entries.map((entry) {
                              int i = entry.key;
                              String text = entry.value['title'] ?? '';
                              String icon = entry.value['icon'] ?? '';

                              double animationValue =
                                  (_pointsController.value - (i * 0.1))
                                      .clamp(0.0, 1.0);

                              return Opacity(
                                opacity: animationValue,
                                child: Transform.translate(
                                  offset: Offset(0, 50 * (1 - animationValue)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Image.asset(
                                              'assets/images/$icon',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(text,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  if (showgetStartedButton)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EmailScreen(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            child: Text(
                              "Get Started",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          : showLogoAndName(),
    );
  }

  showLogoAndName() {
    return Stack(
      children: [
        Positioned(
            top: 50,
            child: Image.asset(
              'assets/images/bg_logo.png',
              height: 200,
              width: 200,
            )),
        Positioned(
            bottom: -10,
            right: -10,
            child: Image.asset(
              'assets/images/bg_logo.png',
              height: 200,
              width: 200,
            )),
        // if (!_showLogoandNameCompleted)
        AnimatedAlign(
          alignment: _showName ? Alignment.centerLeft : Alignment.center,
          duration: const Duration(milliseconds: 600),
          curve: Curves.ease,
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Image.asset(
              'assets/images/hx_logo.png',
              width: 50,
              height: 50,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        // if (!_showLogoandNameCompleted)
        AnimatedAlign(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 600),
          curve: Curves.ease,
          child: AnimatedOpacity(
            opacity: _showName ? 1 : 0,
            duration: const Duration(milliseconds: 600),
            child: AnimatedSlide(
              offset: _showName ? const Offset(0, 0) : const Offset(1, 0),
              duration: const Duration(milliseconds: 600),
              child: Image.asset(
                'assets/images/hx_name.png',
                width: 200,
                height: 100,
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
