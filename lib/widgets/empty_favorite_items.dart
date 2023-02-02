import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';

import '../main_home_page.dart';

class EmptyFav extends StatefulWidget {
  const EmptyFav({Key? key}) : super(key: key);

  @override
  State<EmptyFav> createState() => _EmptyFavState();
}

class _EmptyFavState extends State<EmptyFav> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 200,
        ),
        Text(
          'Oops! you dont have wishlist',
          style: titleTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        Text(
          'Lets find something for you',
          style: descTextStyle.copyWith(fontSize: 14),
        ),
        const SizedBox(
          height: 17,
        ),
        Container(
          alignment: Alignment.center,
          width: 135,
          height: 34,
          decoration: BoxDecoration(
            color: lightOrangeColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/', (Route route) => false);
              setState(() {
                MainHomePage.pageIndex = 0;
              });
            },
            child: Text(
              'Explore Product',
              style: buttonTextStyle.copyWith(
                color: orangeColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
