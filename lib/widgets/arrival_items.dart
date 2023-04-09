// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:furnishop/currency_format.dart';
import 'package:furnishop/datas/cart_data.dart';
import 'package:furnishop/datas/categories_data.dart';
import 'package:furnishop/screens/details_sreen.dart';
import 'package:furnishop/styles.dart';

import '../models/cart.dart';

// ignore: must_be_immutable
class ArrivalItems extends StatefulWidget {
  final VoidCallback onFavoriteSelected;

  final String id;
  final String title;
  final String desc;
  final int price;
  final String catId;
  final List img;
  bool isFavorite = false;

  ArrivalItems(
    this.id,
    this.title,
    this.desc,
    this.price,
    this.catId,
    this.img,
    this.isFavorite, {
    super.key,
    required this.onFavoriteSelected,
  });

  @override
  State<ArrivalItems> createState() => _ArrivalItemsState();
}

class _ArrivalItemsState extends State<ArrivalItems> {
  int decimalDigit = 0;

  void _addCartData(String txId, int txQty) {
    final newCart = Cart(
      id: txId,
      qty: txQty,
      isSelected: false,
    );

    setState(() {
      cartData.add(newCart);
    });

    print(cartData);
  }

  @override
  Widget build(BuildContext context) {
    final catTitle =
        categoriesData.firstWhere((element) => element.id == widget.catId);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: whiteColor,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                DetailsProduct.routeName,
                arguments: {
                  'id': widget.id,
                  'title': widget.title,
                  'desc': widget.desc,
                  'price': widget.price,
                  'catId': widget.catId,
                  'img': widget.img,
                  'isFav': widget.isFavorite,
                },
              );
            },
            onDoubleTap: (() {
              widget.onFavoriteSelected();
            }),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.7,
                          width: constraints.maxWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(widget.img[0]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 7, top: 5),
                          width: constraints.maxWidth * 0.15,
                          height: constraints.maxHeight * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.isFavorite == true
                                ? redColor
                                : greyColor,
                            image: const DecorationImage(
                              image: AssetImage('assets/love_icon.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.01,
                    ),
                    Text(
                      widget.title,
                      style: titleTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      catTitle.title,
                      style: descTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          CurrencyFormat.convertToIdr(
                            widget.price,
                            decimalDigit,
                          ),
                          style: titleTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            var currentIndex = cartData.indexWhere(
                                (element) => element.id == widget.id);

                            if (currentIndex == -1) {
                              _addCartData(widget.id, 1);
                            } else {
                              if (widget.id == cartData[currentIndex].id) {
                                cartData[currentIndex].qty++;
                                print(cartData[currentIndex].qty);
                              }
                            }
                          },
                          child: Container(
                            width: constraints.maxHeight * 0.1,
                            height: constraints.maxHeight * 0.1,
                            decoration: BoxDecoration(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
