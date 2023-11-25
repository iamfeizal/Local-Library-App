import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/books_data.dart';

class DetailScreen extends StatefulWidget {
  final BookData book;

  const DetailScreen({super.key, required this.book});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.book.title, style: GoogleFonts.montserrat(),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                String text = "";
                Color color = Colors.black;
                setState(() {
                  widget.book.isBookmarked = !widget.book.isBookmarked;
                });

                if (widget.book.isBookmarked) {
                  text = 'Berhasil Menambahkan Bookmark';
                  color = Colors.green;
                } else {
                  text = 'Berhasil Menghapus Bookmark';
                  color = Colors.red;
                }

                var snackBar = SnackBar(
                  content: Text(text, style: GoogleFonts.montserrat(),),
                  backgroundColor: color,
                  duration: Duration(seconds: 1),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: (widget.book.isBookmarked)
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_outline),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              alignment: Alignment.center,
              child: Hero(
                tag: widget.book.title,
                child: Image.network(widget.book.imageLink),
              ),
            ),
            SafeArea(child: Column(
              children: [
                const SizedBox(height: 20),
                _buildText('Book Title', widget.book.title),
                _buildText('Author', widget.book.author),
                _buildText('Year Published', widget.book.year.toString()),
                _buildText('Country', widget.book.country),
                _buildText('Language', widget.book.language),
                _buildText('Total Page', widget.book.pages.toString()),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var url = Uri.parse(widget.book.link);
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
          child: Text(label, style: GoogleFonts.montserrat()),
        ),
        Text(' : ', style: GoogleFonts.montserrat()),
        Flexible(
          flex: 2,
          child: Text(value, style: GoogleFonts.montserrat()),
        ),
      ],
    );
  }
}
