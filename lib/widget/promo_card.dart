import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/theme.dart';

class PromoCard extends StatelessWidget {
  final String image;
  final String nameFood;
  final String priceDiskonFood;
  final String priceFood;
  const PromoCard({
    Key? key,
    required this.image,
    required this.nameFood,
    required this.priceDiskonFood,
    required this.priceFood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      width: 160,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 110,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 12, top: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameFood,
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          priceDiskonFood,
                          style: blackTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Text(
                          priceFood,
                          style: greyTextStyle.copyWith(
                              fontWeight: semiBold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
