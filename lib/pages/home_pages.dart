import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/theme.dart';
import 'package:flutter_challenge/widget/category_card.dart';
import 'package:flutter_challenge/widget/popular_card.dart';
import 'package:flutter_challenge/widget/promo_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    'assets/card_promo_1.png',
    'assets/card_promo_2.png',
    'assets/card_promo_3.png',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alamatmu',
                          style: blackTextStyle,
                        ),
                        Text(
                          'Jl. Soekarno Hatta No. 4, Madiun',
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(Icons.history)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Color(0xffEAEAEA),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Mau makan apa hari ini?',
                        hintStyle: GoogleFonts.poppins(
                            color: Color(0xff999999), fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget indicator(index) {
      return Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: currentIndex == index ? greenColor : greyColor,
        ),
      );
    }

    Widget banner() {
      int index = -1;
      return Container(
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            CarouselSlider(
              items: images
                  .map(
                    (image) => Image.asset(
                      image,
                      width: 350,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.map((e) {
                index++;
                return indicator(index);
              }).toList(),
            )
          ],
        ),
      );
    }

    Widget category() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilih kategori',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Lihat semua',
                  style: greenTextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryCard(
                  nameCategory: 'Menu Sehat',
                  image: 'assets/icon/icon_potoffood.png',
                ),
                CategoryCard(
                  nameCategory: 'Promo',
                  image: 'assets/icon/promo_icon.png',
                ),
                CategoryCard(
                  nameCategory: 'Menu Ayam',
                  image: 'assets/icon/icon_chicken.png',
                ),
                CategoryCard(
                  nameCategory: 'Cepat Saji',
                  image: 'assets/icon/icon_fastfood.png',
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget promo() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Voila Promo!',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    'Lihat semua',
                    style: greenTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Ada promo apa ya di sini?',
                style: blackTextStyle,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PromoCard(
                      image: 'assets/slide_food1.png',
                      nameFood: 'Beef Crispy',
                      priceDiskonFood: '15.000',
                      priceFood: '12.500',
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    PromoCard(
                      image: 'assets/slide_food3.png',
                      nameFood: 'Fruits With Garlic',
                      priceDiskonFood: '22.000',
                      priceFood: '24.500',
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    PromoCard(
                      image: 'assets/slide_food2.png',
                      nameFood: 'Banana Bread',
                      priceDiskonFood: '10.500',
                      priceFood: '15.500',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget popular() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wah ada resto enak, loh!',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Yuk cobain!',
              style: blackTextStyle,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Terbaru',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Popular',
                  style: greenTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Rekomendasi',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Color(0xffEAEAEA),
                ),
                Positioned(
                  left: 115,
                  child: Container(
                    width: 76,
                    height: 3,
                    color: greenColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            PopularCard(
              image: 'assets/popular_food1.png',
              nameFood: 'Pizza Hut',
              jarak: '3.4',
              rating: '4.5',
            ),
            PopularCard(
              image: 'assets/popular_food2.png',
              nameFood: 'KFC',
              jarak: '4.8',
              rating: '4.7',
            ),
            PopularCard(
              image: 'assets/popular_food3.png',
              nameFood: 'McDonald',
              jarak: '8.9',
              rating: '4.6',
            )
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                color: Color(0xff00B412),
              ),
              label: 'Eksplor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Riwayat',
            ),
          ],
          selectedLabelStyle: TextStyle(color: Color(0xff00B412)),
          selectedItemColor: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 20)),
              header(),
              banner(),
              category(),
              promo(),
              popular(),
            ],
          ),
        ),
      ),
    );
  }
}
