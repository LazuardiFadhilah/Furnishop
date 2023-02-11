import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int index = 1;

  Widget headerWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(24),
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
              child: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
          Text(
            'Payment Method',
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
            child: const Icon(
              Icons.add,
              color: orangeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentCard(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // Apple Pay
          GestureDetector(
            onTap: () {
              setState(
                () {
                  index = 1;
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        width: constraints.maxHeight,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: bgColor,
                        ),
                        child: Image.asset('assets/apple.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          'Apple Pay',
                          style: pagingTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxHeight * 0.4,
                        height: constraints.maxHeight * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(color: orangeColor, width: 2),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: constraints.maxHeight * 0.25,
                              height: constraints.maxHeight * 0.25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 1 ? orangeColor : whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          // GoPay
          GestureDetector(
            onTap: () {
              setState(() {
                index = 2;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        width: constraints.maxHeight,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: lightBlue.withOpacity(0.1),
                        ),
                        child: Image.asset('assets/gopay.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          'GoPay',
                          style: pagingTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxHeight * 0.4,
                        height: constraints.maxHeight * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(color: orangeColor, width: 2),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: constraints.maxHeight * 0.25,
                              height: constraints.maxHeight * 0.25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 2 ? orangeColor : whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          // Dana
          GestureDetector(
            onTap: () {
              setState(() {
                index = 3;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        width: constraints.maxHeight,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: lightBlue.withOpacity(0.1),
                        ),
                        child: Image.asset('assets/dana.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          'Dana',
                          style: pagingTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxHeight * 0.4,
                        height: constraints.maxHeight * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(color: orangeColor, width: 2),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: constraints.maxHeight * 0.25,
                              height: constraints.maxHeight * 0.25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 3 ? orangeColor : whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),

          // Mastercard
          GestureDetector(
            onTap: (() {
              setState(() {
                index = 4;
              });
            }),
            child: Container(
              padding: const EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: whiteColor,
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        width: constraints.maxHeight,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: lightOrangeColor,
                        ),
                        child: Image.asset('assets/mastercard.png'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          'Mastercard',
                          style: pagingTextStyle.copyWith(
                            fontSize: 14,
                            color: blackColor,
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxHeight * 0.4,
                        height: constraints.maxHeight * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                          border: Border.all(color: orangeColor, width: 2),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: constraints.maxHeight * 0.25,
                              height: constraints.maxHeight * 0.25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == 4 ? orangeColor : whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            headerWidget(context),
            paymentCard(context),
          ],
        ),
      ),
    );
  }
}
