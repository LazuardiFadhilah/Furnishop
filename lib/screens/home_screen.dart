import 'package:flutter/material.dart';
import '../styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset('assets/filter_icon.png'),
        ),
        Text(
          'FurniShop',
          style: titlePageTextStyle,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset('assets/empty_cart_icon.png'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: headerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
