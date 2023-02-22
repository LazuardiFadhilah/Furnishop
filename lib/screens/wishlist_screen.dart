import 'package:flutter/material.dart';
import 'package:furnishop/datas/items_data.dart';
import 'package:furnishop/styles.dart';
import 'package:furnishop/widgets/empty_favorite_items.dart';
import 'package:furnishop/widgets/favorite_items.dart';

import 'cart_screen.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  final filterData = itemsData.where(
    (element) => element.isFavorite == true,
  );

  WishlistScreen({Key? key}) : super(key: key);

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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset('assets/empty_cart_icon.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget wishlistItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ...filterData.map(
            (e) => FavoriteItems(
              id: e.id,
              title: e.title,
              catTitle: e.catId,
              desc: e.desc,
              price: e.price,
              img: e.img,
            ),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(context),
              filterData.isEmpty ? const EmptyFav() : wishlistItem(),
            ],
          ),
        ),
      ),
    );
  }
}
