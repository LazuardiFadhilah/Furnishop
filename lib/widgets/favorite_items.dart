import 'package:flutter/material.dart';
import 'package:furnishop/datas/categories_data.dart';
import 'package:furnishop/styles.dart';

import '../currency_format.dart';

class FavoriteItems extends StatelessWidget {
  final String id;
  final String title;
  final String catTitle;
  final int price;
  final List img;

  const FavoriteItems({
    super.key,
    required this.id,
    required this.title,
    required this.catTitle,
    required this.price,
    required this.img,
  });

  final bool isFav = true;

  @override
  Widget build(BuildContext context) {
    final titleCat = categoriesData.firstWhere((e) => e.id == catTitle);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: constraints.maxHeight * 1,
                    width: constraints.maxHeight * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(img[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: titleTextStyle,
                        ),
                        Text(
                          titleCat.title,
                          style: descTextStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(
                            price,
                            0,
                          ),
                          style: titleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth * 0.1,
                    height: constraints.maxWidth * 0.1,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: redColor,
                    ),
                    child: Image.asset('assets/love_icon.png'),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
