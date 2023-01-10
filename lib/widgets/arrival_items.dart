import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';
// ignore: unused_import
import '../screens/home_screen.dart';

// ignore: must_be_immutable
class ArrivalItems extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            image: AssetImage(img[0]),
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
                          color: isFavorite == true ? redColor : greyColor,
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
                    title,
                    style: titleTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
