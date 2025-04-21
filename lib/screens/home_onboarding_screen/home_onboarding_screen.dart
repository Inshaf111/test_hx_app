import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:test_hx_app/config/theme_constants.dart';

import '../bottom_tab_navigator.dart';
import 'cubit/home_onboarding_cubit.dart';
import 'widgets/animated_checked_icon.dart';

class HomeOnboardingScreen extends StatefulWidget {
  const HomeOnboardingScreen({super.key});

  @override
  State<HomeOnboardingScreen> createState() => _HomeOnboardingScreenState();
}

class _HomeOnboardingScreenState extends State<HomeOnboardingScreen>
    with TickerProviderStateMixin {
  late Stream<String> _dotsStream;
  late StreamController<String> _dotsController;
  late Timer _dotTimer;

  @override
  void initState() {
    super.initState();
    _dotsController = StreamController<String>();
    _dotsStream = _dotsController.stream;

    _startDotAnimation();
  }

  void _startDotAnimation() {
    int count = 0;
    const List<String> dots = ['.', '..', '...'];
    _dotTimer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      _dotsController.sink.add(dots[count % 3]);
      count++;
    });
  }

  @override
  void dispose() {
    _dotsController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: BlocConsumer<HomeOnboardingCubit, HomeOnboardingState>(
                bloc: context.read<HomeOnboardingCubit>().startOnboarding(),
                listener: (context, state) {
                  if (state is HomeOnboardingCompleted) {
                    _dotTimer.cancel();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomTabNavigator(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is HomeOnboardingProgress) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<String>(
                            stream: _dotsStream,
                            builder: (context, snapshot) {
                              String dots = snapshot.data ?? '';
                              return Text(
                                state.currentStep > 5
                                    ? "Your personalized dashboard is ready!"
                                    : "We are building your dashboard$dots",
                                textAlign:
                                    TextAlign.center, //We are building your
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Sentient',
                                ),
                              );
                            }),
                        const SizedBox(height: 16),
                        if (state.currentStep < 3 && state.currentStep < 5)
                          const Text(
                            "It will only take a moment, John.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )
                        else if (state.currentStep < 6)
                          const Text(
                            "You’re nearly there...",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )
                        else
                          const Text(
                            "All Set",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (state.currentStep < 2)
                              const CupertinoActivityIndicator(
                                radius: 12,
                                color: Colors.white,
                              )
                            else
                              AnimatedCheckIcon(),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              state.currentStep < 2
                                  ? "Setting Profile"
                                  : "Profile Complete",
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        if (state.currentStep < 3)
                          ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: state.currentStep < 2
                                  ? 0.5
                                  : 1, // Show only top 50% height
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.circle_outlined,
                                      size: 24,
                                      color: Colors.white.withOpacity(0.4)),
                                  const SizedBox(width: 10),
                                  Text("Setting up your Dashboard",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Colors.white.withOpacity(0.4))),
                                ],
                              ),
                            ),
                          ),
                        if (state.currentStep == 3)
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.circle_outlined,
                                  size: 24, color: Colors.white),
                              SizedBox(width: 10),
                              Text("Setting up your dashboard",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ],
                          ),
                        if (state.currentStep > 3)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.currentStep < 5)
                                const CupertinoActivityIndicator(
                                  radius: 12,
                                  color: Colors.white,
                                )
                              else
                                AnimatedCheckIcon(),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                state.currentStep < 5
                                    ? "Setting up your dashboard"
                                    : "Dashboard Completed",
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
