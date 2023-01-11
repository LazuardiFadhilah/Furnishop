import 'package:flutter/material.dart';
import 'package:furnishop/currency_format.dart';
import 'package:furnishop/datas/categories_data.dart';
import 'package:furnishop/styles.dart';

// ignore: must_be_immutable
class ArrivalItems extends StatefulWidget {
  final String id;
  final String title;
  final String desc;
  final int price;
  final String catId;
  final List img;
  bool isFavorite = false;

  ArrivalItems(this.id, this.title, this.desc, this.price, this.catId, this.img,
      this.isFavorite,
      {super.key});

  @override
  State<ArrivalItems> createState() => _ArrivalItemsState();
}

class _ArrivalItemsState extends State<ArrivalItems> {
  int decimalDigit = 0;

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
            onDoubleTap: (() {
              setState(
                () {
                  if (widget.isFavorite == false) {
                    widget.isFavorite = true;
                  } else {
                    widget.isFavorite = false;
                  }
                },
              );
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
                          onTap: () {},
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
