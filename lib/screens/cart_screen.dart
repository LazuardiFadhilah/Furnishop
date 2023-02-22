import 'package:flutter/material.dart';
import 'package:furnishop/main_home_page.dart';
import 'package:furnishop/styles.dart';

import '../currency_format.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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

  Widget footer(context, int price) {
    return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    int price = 0;
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: footer(context, price),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            header(context),
            emptyCart(context),
          ],
        ),
      ),
    );
  }
}
