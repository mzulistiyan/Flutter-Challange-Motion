import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/theme.dart';

class PopularCard extends StatelessWidget {
  final String nameFood;
  final String jarak;
  final String image;
  const PopularCard({
    Key? key,
    required this.image,
    required this.nameFood,
    required this.jarak,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 90,
              height: 70,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameFood,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: yellowColor,
                    size: 15,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffECECEC),
                    size: 15,
                  ),
                  Text(
                    '4.5',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              Text(
                '${jarak} km',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
