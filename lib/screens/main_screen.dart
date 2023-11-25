import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_screen.dart';
import '../models/books_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Data Buku', style: GoogleFonts.montserrat(),),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <=700){
              return BooksGrid(gridCount: 2,);
            } else if (constraints.maxWidth <=950) {
              return BooksGrid(gridCount: 3,);
            } else if (constraints.maxWidth <=1200) {
              return BooksGrid(gridCount: 4,);
            } else if (constraints.maxWidth <=1400) {
              return BooksGrid(gridCount: 5,);
            } else {
              return BooksGrid(gridCount: 6,);
            }
          },
        )
    );
  }
}

class BooksGrid extends StatelessWidget {
  final int gridCount;
  const BooksGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: bookList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        childAspectRatio: 0.55,
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
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: Hero(
                      tag: book.title,
                      child: Image.network(
                        book.imageLink,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        book.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold)
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        book.author,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w200)
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

