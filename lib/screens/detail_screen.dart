import 'package:flutter/material.dart';
import 'package:local_library_app/widgets/detail_banner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/books_data.dart';

class DetailScreen extends StatelessWidget {
  final BookData book;

  const DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(book.title),
        actions: [ActionBookmark(dataBookmark: book)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DetailBanner(book: book, size: size,),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Book Details ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildText('Book Title', book.title),
                        _buildText('Author', book.author),
                        _buildText('Year Published', book.year.toString()),
                        _buildText('Country', book.country),
                        _buildText('Language', book.language),
                        _buildText('Total Page', book.pages.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = Uri.parse(book.link);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        child: const Icon(Icons.travel_explore),
      ),
    );
  }

  Widget _buildText(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(label),
        ),
        const Text(' : '),
        Flexible(
          child: Text(value),
        ),
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
