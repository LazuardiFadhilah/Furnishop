// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:furnishop/datas/categories_data.dart';
import 'package:furnishop/main_home_page.dart';
import 'package:furnishop/widgets/arrival_items.dart';
import 'package:furnishop/widgets/categories_card.dart';

import '../datas/items_data.dart';
import '../styles.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = '';

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset('assets/filter_icon.png'),
        ),
        Text(
          'FurniShop',
          style: titlePageTextStyle,
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
    );
  }

  // Widget searchBar(context) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 12),
  //     height: 52,
  //     width: MediaQuery.of(context).size.width - 48,
  //     decoration: BoxDecoration(
  //       color: whiteColor,
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Image.asset('assets/search_icon.png'),
  //         const SizedBox(
  //           width: 10,
  //         ),
  //         Expanded(
  //           child: TextField(
  //             decoration: InputDecoration.collapsed(
  //               hintText: 'Search Product',
  //               hintStyle: descTextStyle.copyWith(
  //                 fontSize: 14,
  //               ),
  //             ),
  //             style: descTextStyle.copyWith(
  //               color: blackColor,
  //               fontSize: 14,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 2,
  //         ),
  //         Image.asset(
  //           'assets/mic_icon.png',
  //           height: 24,
  //           width: 24,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget promoBar(context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: AssetImage('assets/promo_img.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: blackColor.withOpacity(0.3),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: constraints.maxHeight * 0.15,
                    width: constraints.maxWidth * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: blackColor,
                    ),
                    child: Text(
                      'Room Package',
                      style: buttonTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.15,
                  ),
                  Text(
                    'New',
                    style: descTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: orangeColor,
                    ),
                  ),
                  Text(
                    'Sale Up \nTo 70% Off',
                    textAlign: TextAlign.left,
                    style: buttonTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: constraints.maxWidth * 0.3,
                    height: constraints.maxHeight * 0.2,
                    decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buy Now',
                          style: buttonTextStyle,
                        ),
                        const Icon(
                          Icons.navigate_next_rounded,
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget arrivalCard() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(
        left: 24,
        right: 12,
      ),
      child: Row(
        children: itemsData
            .map(
              (itmData) => ArrivalItems(
                onFavoriteSelected: () {
                  setState(
                    () {
                      if (itmData.isFavorite == false) {
                        itmData.isFavorite = true;
                      } else {
                        itmData.isFavorite = false;
                      }
                    },
                  );
                },
                itmData.id,
                itmData.title,
                itmData.desc,
                itmData.price,
                itmData.catId,
                itmData.img,
                itmData.isFavorite,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget categoriesCard(context) {
    var subCatData = categoriesData.sublist(0, 4);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(
        left: 24,
        right: 12,
      ),
      child: Row(
        children: [
          ...subCatData
              .map(
                (ctgData) => GestureDetector(
                  onTap: () => setState(() {
                    selectedCategory = ctgData.id;
                  }),
                  child: CategoryCard(
                    id: ctgData.id,
                    image: ctgData.image,
                    selectedCategory: selectedCategory,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Widget categoryItemCard() {
    var filterData = itemsData.where((e) => e.catId == selectedCategory);
    var allData = selectedCategory == '' ? itemsData : filterData;
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        children: allData
            .map(
              (fltData) => CategoryItemCard(
                onFavoriteSelected: () {
                  setState(
                    () {
                      if (fltData.isFavorite == false) {
                        fltData.isFavorite = true;
                      } else {
                        fltData.isFavorite = false;
                      }
                    },
                  );
                },
                id: fltData.id,
                catId: fltData.catId,
                desc: fltData.desc,
                img: fltData.img,
                isFavorite: fltData.isFavorite,
                price: fltData.price,
                title: fltData.title,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 124),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: headerWidget(),
                ),
                const SizedBox(
                  height: 24,
                ),
                // searchBar(context),
                // const SizedBox(
                //   height: 24,
                // ),

                // PromoBar
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      promoBar(context),
                      const SizedBox(
                        width: 12,
                      ),
                      promoBar(context),
                    ],
                  ),
                ),
                // end of PromoBar

                const SizedBox(
                  height: 24,
                ),

                // New Arrival
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'New Arrival',
                        style: titleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                arrivalCard(),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'By Categories',
                        style: titleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (Route route) => false);
                          setState(() {
                            MainHomePage.pageIndex = 1;
                          });
                        },
                        child: Text(
                          'See all',
                          style: pagingTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                categoriesCard(context),
                const SizedBox(
                  height: 12,
                ),
                categoryItemCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
