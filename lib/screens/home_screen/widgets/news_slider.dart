import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsSliderCard extends StatefulWidget {
  const NewsSliderCard({super.key});

  @override
  State<NewsSliderCard> createState() => _NewsSliderCardState();
}

class _NewsSliderCardState extends State<NewsSliderCard> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  late Timer _timer;

  final List<Map<String, String>> _newsItems = [
    {
      'title': "How to Maximise Your 401(k) ",
      'subtitle': "With the 2024 tax deadline now in the rear-view mirror, ",
    },
    {
      'title': "Smart Investing in Uncertain Times",
      'subtitle':
          "Learn how to diversify and stay confident during market volatility.",
    },
    {
      'title': "Tax Benefits You Might Be Missing",
      'subtitle':
          "Explore deductions and credits to optimize your tax filing next year.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_controller.hasClients) {
        _currentPage = (_currentPage + 1) % _newsItems.length;
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: PageView.builder(
                controller: _controller,
                itemCount: _newsItems.length,
                itemBuilder: (context, index) {
                  final item = _newsItems[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          'assets/images/tax.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item['subtitle']!,
                              style: const TextStyle(fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            SmoothPageIndicator(
              controller: _controller,
              count: _newsItems.length,
              effect: const WormEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  spacing: 6,
                  activeDotColor: Colors.black,
                  dotColor: Colors.grey,
                  type: WormType.thin),
            ),
          ],
        ),
      ),
    );
  }
}
