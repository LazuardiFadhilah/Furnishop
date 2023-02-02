// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:furnishop/datas/categories_data.dart';
import 'package:furnishop/styles.dart';

import '../datas/items_data.dart';
import '../widgets/categories_card.dart';
import '../widgets/category_item.dart';

class ExploreScreen extends StatefulWidget {
  static const routeName = '/explore-screen';
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectCat = '';
  int catRange = 4;

  List _foundUser = [];

  @override
  void initState() {
    _foundUser = itemsData;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List result = [];
    if (enteredKeyword.isEmpty) {
      result = itemsData;
    } else {
      result = itemsData
          .where(
              (element) => element.title.toLowerCase().contains(enteredKeyword))
          .toList();
    }

    setState(() {
      _foundUser = result;
    });
  }

  Widget headerExplore() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Explore Product',
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
    );
  }

  Widget searchBar(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 52,
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/search_icon.png'),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                _runFilter(value);
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Search Product',
                hintStyle: descTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              style: descTextStyle.copyWith(
                color: blackColor,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Image.asset(
            'assets/mic_icon.png',
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }

  Widget categories(context) {
    var selectTitle =
        categoriesData.firstWhere((element) => element.id == selectCat);
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By Categories "${selectTitle.title}"',
                style: titleTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (catRange == 4) {
                      catRange = categoriesData.length;
                    } else {
                      catRange = 4;
                    }
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
      ],
    );
  }

  Widget categoriesCard(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: catRange == 4
            ? MediaQuery.of(context).size.width * 0.25
            : MediaQuery.of(context).size.width * 0.45,
        padding: const EdgeInsets.only(left: 24, right: 12),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              setState(() {
                selectCat = categoriesData[index].id;
              });
            },
            child: CategoryCard(
              id: categoriesData[index].id,
              image: categoriesData[index].image,
              selectedCategory: selectCat,
            ),
          ),
          itemCount: catRange,
        ));
  }

  Widget categoryItemCard() {
    var filterData = _foundUser.where((e) => e.catId == selectCat);
    var allData = selectCat == '' ? _foundUser : filterData;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
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
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              headerExplore(),
              searchBar(context),
              categories(context),
              categoriesCard(context),
              categoryItemCard(),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
