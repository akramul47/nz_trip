import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: screenSize.height * 0.3,
            child: SvgPicture.asset(
              'assets/images/coming_soon.svg',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'COMING SOON...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
