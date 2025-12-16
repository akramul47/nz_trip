import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/theme.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/coming_soon.dart';
import '../widgets/flight_booking_form.dart';
import '../widgets/promo_banner.dart';
import '../widgets/service_chips.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedServiceIndex = 0;
  final PageController _pageController = PageController();

  void _jumpToPage(int index) {
    if (_selectedServiceIndex == index) return;

    setState(() {
      _selectedServiceIndex = index;
      // Jump directly without animation when chip is tapped
      _pageController.jumpToPage(index);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        children: [
          Container(
            // height: screenSize.height * 0.21,
            height: 190,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 55,
                          ),
                        ),
                        Container(
                          width: screenSize.width * 0.6,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.chipBackground,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/images/language.svg',
                                height: 20,
                                width: 20,
                              ),
                              const SizedBox(width: 12),
                              Row(
                                children: [
                                  const Text(
                                    '5000.00',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SvgPicture.asset(
                                    'assets/images/currency.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    'MYR',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.6,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Language',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Text(
                                'Currency',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ServiceChips(
                    onChipSelected: _jumpToPage,
                    selectedIndex: _selectedServiceIndex,
                  ),
                ],
              ),
            ),
          ),

          // Main content with PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                // Only animate chip selection when user is scrolling
                setState(() {
                  _selectedServiceIndex = index;
                });
              },
              children: [
                // Flights page
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const FlightBookingForm(),
                      const SizedBox(height: 24),
                      const PromoBanner(),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/tag.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Exclusive flight deals on your hand, grab it now !!!',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                // Hotels page
                const ComingSoonWidget(),
                // Flights + Hotels page
                const ComingSoonWidget(),
                // Transports page
                const ComingSoonWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
