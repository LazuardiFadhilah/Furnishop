import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:furnishop/datas/cart_data.dart';
import 'package:furnishop/datas/categories_data.dart';
import 'package:furnishop/datas/items_data.dart';

import '../currency_format.dart';
import '../styles.dart';

class CartItems extends StatefulWidget {
  final String id;
  final int qty;
  final bool isSelected;

  final VoidCallback addQty;
  final VoidCallback delQty;
  final VoidCallback selectItem;

  const CartItems({
    super.key,
    required this.id,
    required this.qty,
    required this.addQty,
    required this.delQty,
    required this.selectItem,
    required this.isSelected,
  });

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    var itemData = itemsData.firstWhere(
      (element) => element.id == widget.id,
    );
    var imageItem = itemData.img;
    var titleItem = itemData.title;
    var catItem = categoriesData.firstWhere(
      (element) => element.id == itemData.catId,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                widget.selectItem();
                print(cartData.map((e) => e.isSelected));
              },
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: !widget.isSelected ? whiteColor : orangeColor,
                  border: !widget.isSelected
                      ? Border.all(color: blackColor, width: 2)
                      : Border.all(color: whiteColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: !widget.isSelected
                    ? const SizedBox()
                    : const Icon(
                        Icons.check,
                        color: whiteColor,
                        size: 10,
                      ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage('${imageItem[0]}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleItem,
                  style: titleTextStyle,
                ),
                Text(
                  catItem.title,
                  style: descTextStyle,
                ),
                Text(
                  CurrencyFormat.convertToIdr(
                    itemData.price,
                    0,
                  ),
                  style: titleTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Icon(
                  Icons.favorite,
                  size: 12,
                  color: greyColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Move to Wishlist',
                  style: descTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: widget.delQty,
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: whiteColor,
                      size: 15,
                    ),
                  ),
                  Text(
                    widget.qty.toString(),
                    style: titleTextStyle.copyWith(
                      color: whiteColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.addQty,
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: whiteColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(
          thickness: 0.5,
          color: greyColor,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
