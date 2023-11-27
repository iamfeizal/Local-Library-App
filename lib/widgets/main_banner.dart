import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_library_app/models/books_data.dart';

import '../screens/detail_screen.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    var bookBanner = bookList[0];
    double widthBanner = MediaQuery.of(context).size.width - 40;
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    var message = '';
    if (timeNow <= 12) {
      message = 'Good Morning!';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afternoon!';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'Good Evening!';
    } else {
      message = 'Warm Night! ';
    }

    return Align(
      alignment: Alignment.center,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                width: widthBanner,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(bookBanner.imageLink),
                    fit: BoxFit.fitWidth,
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.85),
                      BlendMode.srcATop,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(
                          book: bookBanner,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          message,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Which book suits with your current mood?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(0.75),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(
                          book: bookBanner,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: widthBanner - 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 80,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple,
                              image: DecorationImage(
                                image: NetworkImage(bookBanner.imageLink),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text(
                                  bookBanner.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text(
                                  'Author: ${bookBanner.author}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}