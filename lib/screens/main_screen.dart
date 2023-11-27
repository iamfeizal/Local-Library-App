import 'package:flutter/material.dart';
import 'package:local_library_app/models/books_data.dart';
import 'package:local_library_app/widgets/main_banner.dart';
import 'package:local_library_app/widgets/custom_banner.dart';

import '../widgets/book_card.dart';
import 'detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Books'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <=700){
              return const BooksGrid();
            } else {
              return const BooksGrid();
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
            const MainBanner(),
            const SizedBox(height: 20),
            const TrendingBanner(customText: 'Top Trends',),
            const SizedBox(height: 15),
            SizedBox(
              height: 300,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var book = bookList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            book: book,
                          ),
                        ),
                      );
                    },
                    child: BookCard(
                      imagepic: book.imageLink,
                      text1: book.title,
                      text2: book.author,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const TrendingBanner(customText: 'Best Sellers',),
            const SizedBox(height: 15),
            SizedBox(
              height: 300,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var reversedIndex = bookList.length - 1 - index;
                  var book = bookList[reversedIndex];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            book: book,
                          ),
                        ),
                      );
                    },
                    child: BookCard(
                      imagepic: book.imageLink,
                      text1: book.title,
                      text2: book.author,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}