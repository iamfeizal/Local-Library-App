import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_library_app/widgets/category_banner.dart';
import 'package:local_library_app/widgets/main_banner.dart';
import 'package:local_library_app/widgets/trending_banner.dart';

import '../widgets/book_card.dart';
import 'detail_screen.dart';
import '../models/books_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Books'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <=700){
              return BooksGrid();
            } else {
              return BooksGrid();
            }
          },
        )
    );
  }
}

class BooksGrid extends StatefulWidget {
  const BooksGrid({super.key});

  @override
  State<BooksGrid> createState() => _BooksGridState();
}

class _BooksGridState extends State<BooksGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MainBanner(),
            SizedBox(height: 5),
            CategoryBanner(),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/mom.jpg',
                      text1: 'Amma Vanthaal',
                      text2: 'Janaki Raman',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/thippu.jpg',
                      text1: 'Thippu Sulthaan',
                      text2: 'Arshiya',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/kural.jpeg',
                      text1: 'Thiruvalluvar',
                      text2: 'Gauthama Sanna',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/ponniyin.jpg',
                      text1: 'Ponniyin Selvan',
                      text2: 'Kalki',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/raja.jpg',
                      text1: 'Raja Raja Cholan',
                      text2: 'Kannan',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/richdad.jpg',
                      text1: 'Rich Dad poor Dad',
                      text2: 'Robert',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/vekkai.jpg',
                      text1: 'Vekkai',
                      text2: 'Poomani',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/wings.jpg',
                      text1: 'Wings of Fire',
                      text2: 'Dr. Kalam',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/images/money.jpg',
                      text1: 'Physiology of money',
                      text2: 'Morgan',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TrendingBanner(),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/english/bts.jpg',
                      text1: 'BTS Army',
                      text2: 'Bts',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/english/slauter.jpg',
                      text1: 'Slaughter',
                      text2: 'Ryan & Albert',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/english/heart.jpg',
                      text1: 'Heart of Happiness',
                      text2: 'Dalai Lama',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/english/smarter.jpg',
                      text1: 'The Power of Habit',
                      text2: 'Charles Duhigg',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/english/magic.jpg',
                      text1: 'Magic of Thinking',
                      text2: 'Mark Swartz',
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: BookCard(
                      imagepic: 'assets/english/subtle.jpg',
                      text1: 'The Subtle Art',
                      text2: 'Mark Manson',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}