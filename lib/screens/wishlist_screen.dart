import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  const WishlistScreen({Key? key}) : super(key: key);

  Widget header(context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Wishlist Items',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            header(context),
          ],
        ),
      ),
    );
  }
}
