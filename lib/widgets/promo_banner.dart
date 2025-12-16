import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final List<String> _bannerImages = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      child: Swiper(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(_bannerImages[index]),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          );
        },
        itemCount: _bannerImages.length,
        viewportFraction: 0.8,
        scale: 0.85,
        autoplay: true,
        autoplayDelay: 3000,
        duration: 500,
        layout: SwiperLayout.DEFAULT,
        control: const SwiperControl(
          color: Colors.transparent,
        ),
        pagination: null,
      ),
    );
  }
}
