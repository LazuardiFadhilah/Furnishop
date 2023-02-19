// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../screens/details_sreen.dart';

class FamiliarProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String desc;
  final int price;
  final String catId;
  final List img;
  bool isFavorite = false;

  FamiliarProductItems({
    super.key,
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.catId,
    required this.img,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              DetailsProduct.routeName,
              arguments: {
                'id': id,
                'title': title,
                'desc': desc,
                'price': price,
                'catId': catId,
                'img': img,
                'isFav': isFavorite,
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(img[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
