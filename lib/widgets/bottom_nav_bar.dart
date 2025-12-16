import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../config/theme.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<String> _svgIcons = [
    'assets/images/Home.svg',
    'assets/images/Bookings.svg',
    'assets/images/upcoming.svg',
    'assets/images/deposits.svg',
    'assets/images/profile.svg',
  ];

  final List<String> _labels = [
    'Home',
    'Bookings',
    'Upcoming\nFlights',
    'Deposits',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _svgIcons.length,
          (index) => _buildNavItem(index),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: MediaQuery.of(context).size.width / _svgIcons.length,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : null,
          gradient: isSelected
              ? null
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.grey.shade200,
                    Colors.grey.shade300,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
        ),
        child: Column(
          children: [
            // Fixed height container for icons
            Container(
              height: 40,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                _svgIcons[index],
                height: 17,
                width: 17,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
            // Fixed height container for text
            Container(
              height: 30,
              alignment: Alignment.center,
              child: Text(
                _labels[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      isSelected ? AppColors.primary : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
