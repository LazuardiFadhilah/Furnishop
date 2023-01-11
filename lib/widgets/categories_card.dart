import 'package:flutter/material.dart';
import 'package:furnishop/styles.dart';

class CategoryCard extends StatefulWidget {
  final String id;
  final String image;
  final String selectedCategory;

  const CategoryCard({
    super.key,
    required this.id,
    required this.image,
    required this.selectedCategory,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color:
                widget.selectedCategory == widget.id ? orangeColor : whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ImageIcon(
            AssetImage(widget.image),
            color:
                widget.selectedCategory == widget.id ? whiteColor : blackColor,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
