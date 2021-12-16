import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/theme.dart';

class CategoryCard extends StatelessWidget {
  final String nameCategory;
  final String image;
  const CategoryCard({
    Key? key,
    required this.nameCategory,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEEEDED),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 40,
            height: 40,
          ),
          Text(
            nameCategory,
            style: blackTextStyle.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
