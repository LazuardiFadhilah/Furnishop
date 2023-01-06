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

  Widget searchBar(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 52,
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/search_icon.png'),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Search Product',
                hintStyle: descTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              style: descTextStyle.copyWith(
                color: blackColor,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Image.asset(
            'assets/mic_icon.png',
            height: 24,
            width: 24,
          ),
        ],
      ),
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
            const SizedBox(
              height: 24,
            ),
            searchBar(context),
          ],
        ),
      ),
    );
  }
}
