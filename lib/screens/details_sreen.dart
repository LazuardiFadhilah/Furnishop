import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';

import '../currency_format.dart';

class DetailsProduct extends StatefulWidget {
  static const routeName = '/details-product';

  const DetailsProduct({
    super.key,
  });

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  Widget build(BuildContext context) {
    var index = 0;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final titleItem = routeArgs['title'];
    final priceItem = routeArgs['price'];
    final descItem = routeArgs['desc'];
    final imgItem = routeArgs['img'];
    final isFavItem = routeArgs['isFav'];

    List<Widget> imgRow = [];
    for (var i = 0; i < imgItem.length; i++) {
      imgRow.add(
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = i;
                  print(index);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: i == index ? orangeColor : whiteColor,
                    width: 1,
                  ),
                  image: DecorationImage(
                    image: AssetImage('${imgItem[i]}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                        ),
                      ),
                    ),
                    Text(
                      'Details Product',
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
                // End of Header
                const SizedBox(
                  height: 24,
                ),
                // Item Picture
                Container(
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                        children: [
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage('${imgItem[0]}'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$titleItem',
                                    style: titlePageTextStyle.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    CurrencyFormat.convertToIdr(
                                      priceItem,
                                      0,
                                    ),
                                    style: titleTextStyle.copyWith(
                                      fontSize: 18,
                                      color: orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: constraints.maxHeight * 0.1,
                                width: constraints.maxHeight * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      isFavItem == true ? redColor : greyColor,
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: imgRow,
                          )
                        ],
                      );
                    },
                  ),
                ),
                // End Item Picture
              ],
            ),
          ),
        ),
      ),
    );
  }
}
