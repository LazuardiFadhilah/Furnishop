import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';

import '../currency_format.dart';
import '../datas/categories_data.dart';

// ignore: must_be_immutable
class CategoryItemCard extends StatelessWidget {
  final String id;
  final String title;
  final String desc;
  final int price;
  final String catId;
  final List img;
  bool isFavorite = false;
  CategoryItemCard({
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
    final catTitle =
        categoriesData.firstWhere((element) => element.id == catId);
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width * 1 - 48,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteColor,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                height: constraints.maxHeight * 1 - 12,
                width: constraints.maxHeight * 1 - 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(img[0]),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.15,
                      height: constraints.maxHeight * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFavorite == true ? redColor : greyColor,
                        image: const DecorationImage(
                          image: AssetImage('assets/love_icon.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      catTitle.title,
                      style: descTextStyle,
                    ),
                    Text(
                      title,
                      style: titleTextStyle,
                    ),
                    Text(
                      desc,
                      style: descTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          CurrencyFormat.convertToIdr(
                            price,
                            0,
                          ),
                          style: titleTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: constraints.maxWidth * 0.2,
                            height: constraints.maxHeight * 0.2,
                            decoration: BoxDecoration(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Buy Now',
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}