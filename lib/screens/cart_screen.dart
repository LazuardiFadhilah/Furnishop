// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:furnishop/datas/cart_data.dart';
import 'package:furnishop/datas/items_data.dart';
import 'package:furnishop/main_home_page.dart';
import 'package:furnishop/styles.dart';
import 'package:furnishop/widgets/cart_items.dart';

import '../currency_format.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  static int price = 0;
  static List<int> subTotal = [];
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void subtotal() {
    CartScreen.subTotal = [];
    CartScreen.price = 0;
    var dataTrue =
        cartData.where((element) => element.isSelected == true).toList();

    for (var i = 0; i < dataTrue.length; i++) {
      var filterData =
          itemsData.firstWhere((element) => element.id == dataTrue[i].id);

      CartScreen.subTotal.add(filterData.price * cartData[i].qty);
    }

    for (var i = 0; i < CartScreen.subTotal.length; i++) {
      CartScreen.price += CartScreen.subTotal[i];
    }
    print(CartScreen.subTotal);
    print(CartScreen.price);
  }

  Widget header(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Row(
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
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyCart(context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Text(
          'Oops! your cart is empty',
          style: titleTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        Text(
          'Lets find something for you',
          style: descTextStyle.copyWith(
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              MainHomePage.pageIndex = 1;
            });
            Navigator.pushNamedAndRemoveUntil(
                context, '/', (Route route) => false);
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: lightOrangeColor,
            ),
            child: Text(
              'Explore Product',
              style: titleTextStyle.copyWith(
                fontSize: 12,
                color: orangeColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget hasDataCart() {
    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (cartData
                        .where((element) => element.isSelected == false)
                        .isNotEmpty) {
                      for (var i = 0; i < cartData.length; i++) {
                        cartData[i].isSelected = true;
                      }
                    } else if (cartData
                        .where((element) => element.isSelected == false)
                        .isEmpty) {
                      for (var i = 0; i < cartData.length; i++) {
                        cartData[i].isSelected = false;
                      }
                    }
                    subtotal();
                  });

                  print(cartData.map((e) => e.isSelected));
                },
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: cartData
                            .where((element) => element.isSelected == false)
                            .isNotEmpty
                        ? whiteColor
                        : orangeColor,
                    border: cartData
                            .where((element) => element.isSelected == false)
                            .isNotEmpty
                        ? Border.all(color: blackColor, width: 2)
                        : Border.all(color: whiteColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: cartData
                          .where((element) => element.isSelected == false)
                          .isNotEmpty
                      ? const SizedBox()
                      : const Icon(
                          Icons.check,
                          color: whiteColor,
                          size: 10,
                        ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Select all',
                  style: pagingTextStyle.copyWith(
                    color: blackColor,
                  ),
                ),
              ),
              cartData
                      .where((element) => element.isSelected == false)
                      .isNotEmpty
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          cartData.removeWhere(
                              (element) => element.isSelected == true);
                          subtotal();
                        });
                      },
                      child: Text(
                        'Delete',
                        style: pagingTextStyle.copyWith(
                          color: redColor,
                        ),
                      ),
                    ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: cartData
                .map(
                  (e) => CartItems(
                    // sumPrice: () {
                    //   setState(() {});
                    // },
                    selectItem: () {
                      setState(() {
                        if (e.isSelected == false) {
                          e.isSelected = true;
                        } else {
                          e.isSelected = false;
                        }
                        subtotal();
                      });
                    },
                    isSelected: e.isSelected,
                    delQty: () {
                      setState(
                        () {
                          if (e.qty <= 1) {
                            cartData
                                .removeWhere((element) => element.id == e.id);
                          } else {
                            e.qty--;
                          }
                          subtotal();
                        },
                      );
                    },
                    addQty: () {
                      setState(() {
                        e.qty++;
                        subtotal();
                      });
                    },
                    id: e.id,
                    qty: e.qty,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget footer(context, int price) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        color: whiteColor,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: greyColor.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/discount_icon.png',
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: TextField(
                          style: buttonTextStyle.copyWith(
                            fontSize: 12,
                            color: blackColor,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Use discount coupons to save',
                            hintStyle: descTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.navigate_next_rounded,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Subtotal',
                            style: descTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            price == 0
                                ? 'Rp -'
                                : CurrencyFormat.convertToIdr(
                                    price,
                                    0,
                                  ),
                            style: titleTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: constraints.maxHeight * 0.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: lightOrangeColor,
                        ),
                        child: Text(
                          'Pay Now',
                          style: titleTextStyle.copyWith(
                            fontSize: 16,
                            color: whiteColor,
                          ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: footer(context, CartScreen.price),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(context),
              cartData.isNotEmpty ? hasDataCart() : emptyCart(context),
            ],
          ),
        ),
      ),
    );
  }
}
