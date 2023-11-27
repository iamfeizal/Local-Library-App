import 'package:flutter/material.dart';

import '../models/books_data.dart';
import 'detail_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<BookData> bookmarkedBooks = [];

  @override
  void initState() {
    super.initState();
    // Perform any initialization here, if needed.
    loadBookmarkedBooks();
  }

  void loadBookmarkedBooks() {
    bookmarkedBooks.clear();
    for (BookData item in bookList) {
      if (item.isBookmarked == true) {
        bookmarkedBooks.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Building _BookmarkScreenState");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bookmarked Books'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 700) {
            return BooksGrid(
              gridCount: 2, bookmarkedBooks: bookmarkedBooks,
            );
          } else if (constraints.maxWidth <= 950) {
            return BooksGrid(
              gridCount: 3, bookmarkedBooks: bookmarkedBooks,
            );
          } else if (constraints.maxWidth <= 1200) {
            return BooksGrid(
              gridCount: 4, bookmarkedBooks: bookmarkedBooks,
            );
          } else if (constraints.maxWidth <= 1400) {
            return BooksGrid(
              gridCount: 5, bookmarkedBooks: bookmarkedBooks,
            );
          } else {
            return BooksGrid(
              gridCount: 6, bookmarkedBooks: bookmarkedBooks,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {loadBookmarkedBooks();});
        },
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}

class BooksGrid extends StatelessWidget {
  final int gridCount;
  final List<BookData> bookmarkedBooks;

  const BooksGrid({super.key, required this.gridCount, required this.bookmarkedBooks});

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: bookmarkedBooks.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        childAspectRatio: 0.475,
      ),
      itemBuilder: (context, index) {
        var book = bookmarkedBooks[index];
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
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              child: Column(
                children: [
                  SizedBox(
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
                    padding: const EdgeInsets.all(8),
                    child: Text(book.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(book.author,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200)),
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
