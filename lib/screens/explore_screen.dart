import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';

class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore-screen';
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Widget headerExplore() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Explore Product',
            style: titleTextStyle.copyWith(
              fontSize: 18,
            ),
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
      ),
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
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            headerExplore(),
            searchBar(context),
          ],
        ),
      ),
    );
  }
}
