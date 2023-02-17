import 'package:flutter/material.dart';

class FamiliarProductItems extends StatelessWidget {
  final String img;

  const FamiliarProductItems({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
      ],
    );
  }
}
