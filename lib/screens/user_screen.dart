import 'package:flutter/material.dart';
import 'package:furnishop/screens/payment_screen.dart';
import 'package:furnishop/styles.dart';

class UsersScreen extends StatelessWidget {
  static const routeName = '/users';
  const UsersScreen({Key? key}) : super(key: key);

  Widget header(context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Profile',
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

  Widget profilePic() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
            color: orangeColor, width: 3, strokeAlign: StrokeAlign.outside),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/users.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userName() {
    return Column(
      children: [
        Text(
          'Lazuardi Fadhilah',
          style: titleTextStyle.copyWith(
            fontSize: 18,
          ),
        ),
        Text(
          'Lazuardifadhillah@gmail.com',
          style: descTextStyle.copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget subMenu(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * 1 - 48,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  Container(
                    height: constraints.maxHeight * 1,
                    width: constraints.maxHeight * 1,
                    decoration: BoxDecoration(
                      color: lightOrangeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: orangeColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Active Order',
                      style: pagingTextStyle.copyWith(
                        color: blackColor,
                        fontSize: 14,
                      ),
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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              PaymentScreen.routeName,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * 1 - 48,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  children: [
                    Container(
                      height: constraints.maxHeight * 1,
                      width: constraints.maxHeight * 1,
                      decoration: BoxDecoration(
                        color: lightOrangeColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.payment,
                        color: orangeColor,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        'Payment Method',
                        style: pagingTextStyle.copyWith(
                          color: blackColor,
                          fontSize: 14,
                        ),
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
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * 1 - 48,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  Container(
                    height: constraints.maxHeight * 1,
                    width: constraints.maxHeight * 1,
                    decoration: BoxDecoration(
                      color: lightOrangeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.settings_outlined,
                      color: orangeColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Account Settings',
                      style: pagingTextStyle.copyWith(
                        color: blackColor,
                        fontSize: 14,
                      ),
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

  Widget helpCenter(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Help Center',
          style: pagingTextStyle.copyWith(
            fontSize: 16,
            color: blackColor,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * 1 - 48,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  Container(
                    height: constraints.maxHeight * 1,
                    width: constraints.maxHeight * 1,
                    decoration: BoxDecoration(
                      color: lightOrangeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: orangeColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Costumer Service',
                      style: pagingTextStyle.copyWith(
                        color: blackColor,
                        fontSize: 14,
                      ),
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
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * 1 - 48,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Row(
                children: [
                  Container(
                    height: constraints.maxHeight * 1,
                    width: constraints.maxHeight * 1,
                    decoration: BoxDecoration(
                      color: lightOrangeColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.analytics_outlined,
                      color: orangeColor,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      'Term of Service',
                      style: pagingTextStyle.copyWith(
                        color: blackColor,
                        fontSize: 14,
                      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            header(context),
            const SizedBox(
              height: 12,
            ),
            profilePic(),
            const SizedBox(
              height: 16,
            ),
            userName(),
            const SizedBox(
              height: 36,
            ),
            subMenu(context),
            const SizedBox(
              height: 24,
            ),
            helpCenter(context),
          ],
        ),
      ),
    );
  }
}
