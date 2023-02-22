import 'package:flutter/material.dart';
import 'package:furnishop/datas/items_data.dart';
import 'package:furnishop/screens/cart_screen.dart';
import 'package:furnishop/styles.dart';
import 'package:readmore/readmore.dart';

import '../currency_format.dart';
import '../widgets/familiar_product_items.dart';

// ignore: must_be_immutable
class DetailsProduct extends StatefulWidget {
  static const routeName = '/details-product';
  bool dProduct = false;

  DetailsProduct({
    super.key,
  });

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  var index = 0;

  Widget measurementContent({required String title, required String range}) {
    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: descTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ':',
                  style: descTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  ' $range cm',
                  textAlign: TextAlign.end,
                  style: titleTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget reviews() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: greyColor,
              width: 0.5,
            ),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: constraints.maxWidth * 0.1,
                        height: constraints.maxWidth * 0.1,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/users.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'Lazuardi Fadhilah',
                          style: pagingTextStyle.copyWith(
                            color: blackColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Text(
                        '1 Month Ago',
                        style: descTextStyle.copyWith(
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 15,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    child: Text(
                      '“the product is very good and comfortable. especially the color I really like. delivery is fast”',
                      style: descTextStyle,
                    ),
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

  Widget productReview() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Header Content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dProduct = true;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.37,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Details Product',
                    style: pagingTextStyle.copyWith(
                      color: blackColor,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dProduct = false;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.37,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: lightOrangeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Product Reviews',
                    style: pagingTextStyle,
                  ),
                ),
              ),
            ],
          ),
          // End of header content
          const SizedBox(
            height: 24,
          ),
          // Rating and Reviews
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rating & Reviews',
                style: pagingTextStyle.copyWith(
                  color: blackColor,
                  fontSize: 14,
                ),
              ),
              Text(
                'See all',
                style: pagingTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4.9',
                      style: titlePageTextStyle.copyWith(
                        color: orangeColor,
                        fontSize: 48,
                      ),
                    ),
                    Text(
                      'Out of 5',
                      style: titlePageTextStyle.copyWith(
                        color: orangeColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: lightOrangeColor,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.19,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: orangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: lightOrangeColor,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: orangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: lightOrangeColor,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: orangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: lightOrangeColor,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.02,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: orangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: lightOrangeColor,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.03,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: orangeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          // End of rating reviews
          const SizedBox(
            height: 26,
          ),
          // Reviews from Users
          reviews(),
          reviews(),
          reviews(),
          reviews(),
          // End Reviews from Users
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final titleItem = routeArgs['title'];
    final priceItem = routeArgs['price'];
    final descItem = routeArgs['desc'];
    final imgItem = routeArgs['img'];
    final isFavItem = routeArgs['isFav'];
    final idItem = routeArgs['catId'];

    var filterData =
        itemsData.where((element) => element.catId == idItem).toList();

    List<Widget> imgRow = [];
    for (var i = 0; i < imgItem.length; i++) {
      imgRow.add(
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = i;
                  // ignore: avoid_print
                  print(widget);
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
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
                            height: constraints.maxHeight * 0.65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage('${imgItem[index]}'),
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
                const SizedBox(
                  height: 24,
                ),

                // Content
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: whiteColor,
                  ),
                  child: widget.dProduct == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Content
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.dProduct = true;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.37,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: lightOrangeColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Details Product',
                                        style: pagingTextStyle,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.dProduct = false;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.37,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Product Reviews',
                                        style: pagingTextStyle.copyWith(
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // End of Header Content

                            // Description Content
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description',
                                    style: pagingTextStyle.copyWith(
                                      color: blackColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  ReadMoreText(
                                    '$descItem',
                                    textAlign: TextAlign.justify,
                                    trimLines: 2,
                                    style: descTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                    trimMode: TrimMode.Line,
                                    colorClickableText: orangeColor,
                                    trimCollapsedText: 'Read More',
                                    trimExpandedText: '  Show Less',
                                    moreStyle: descTextStyle.copyWith(
                                      fontSize: 12,
                                      color: orangeColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // End of Description Content

                            // Measurement Content
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Measurement',
                                    style: pagingTextStyle.copyWith(
                                      fontSize: 14,
                                      color: blackColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  measurementContent(
                                      title: 'Wide', range: '204'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  measurementContent(
                                      title: 'Depth', range: '89'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  measurementContent(
                                      title: 'Tall', range: '78'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  measurementContent(
                                      title: 'Armrest Height', range: '64'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  measurementContent(
                                      title: 'Seat Width', range: '180'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  measurementContent(
                                      title: 'Seat Depth', range: '61'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  measurementContent(
                                      title: 'Seat Height', range: '44'),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            ),
                            // end of measurement content

                            // Familiar Product
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Familiar Product',
                                style: pagingTextStyle.copyWith(
                                  fontSize: 14,
                                  color: blackColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 12, bottom: 24),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: filterData
                                      .map(
                                        (e) => FamiliarProductItems(
                                          id: e.id,
                                          title: e.title,
                                          desc: e.desc,
                                          price: e.price,
                                          catId: e.catId,
                                          img: e.img,
                                          isFavorite: e.isFavorite,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            // end of Familiar Product
                          ],
                        )
                      : productReview(),
                ),
                // end of content
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: 34,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.11,
        color: whiteColor,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: orangeColor,
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: pagingTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * 0.4,
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '+ Add to Cart',
                    style: pagingTextStyle.copyWith(
                      fontSize: 14,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
