import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/books_data.dart';

class DetailBanner extends StatelessWidget {
  final BookData book;
  final Size size;
  const DetailBanner({super.key, required this.size, required this.book});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
                top: size.height * .12,
                left: size.width * .1,
                right: size.width * .02),
            height: size.height * .48,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(book.imageLink),
                fit: BoxFit.fitWidth,
                colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.85),
                  BlendMode.srcATop,
                ),
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: BookInfo(
              size: size,
              book: book,
            )),
        Padding(
          padding: EdgeInsets.only(top: size.height * .48 - 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class BookInfo extends StatelessWidget {
  final BookData book;
  final Size size;
  const BookInfo({super.key, required this.book, required this.size});

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    book.title,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * .005),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    book.year.toString(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: size.width * .3,
                      padding:
                      EdgeInsets.only(top: size.height * .02),
                      child: Text(
                        "by ${book.author}",
                        maxLines: 5,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width/12,
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(top: size.height * .015),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          var url = Uri.parse(book.link);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: const Text(
                          "Read",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
        SizedBox(
            height: 300,
            child: Container(
              color: Colors.transparent,
              child: Image.network(
                book.imageLink,
                height: double.infinity,
                alignment: Alignment.topRight,
                fit: BoxFit.fitWidth,
              ),
            )),
      ],
    );
  }
}

class ActionBookmark extends StatefulWidget {
  final BookData dataBookmark;

  const ActionBookmark({super.key, required this.dataBookmark});

  @override
  State<ActionBookmark> createState() => _ActionBookmarkState();
}

class _ActionBookmarkState extends State<ActionBookmark> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IconButton(
        onPressed: () {
          String text = "";
          Color color = Colors.black;
          setState(() {
            widget.dataBookmark.isBookmarked =
            !widget.dataBookmark.isBookmarked;
          });

          if (widget.dataBookmark.isBookmarked) {
            text = 'Berhasil Menambahkan Bookmark';
            color = Colors.green;
          } else {
            text = 'Berhasil Menghapus Bookmark';
            color = Colors.red;
          }

          var snackBar = SnackBar(
            content: Text(text),
            backgroundColor: color,
            duration: const Duration(seconds: 1),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: (widget.dataBookmark.isBookmarked)
            ? const Icon(Icons.bookmark)
            : const Icon(Icons.bookmark_outline),
      ),
    );
  }
}
