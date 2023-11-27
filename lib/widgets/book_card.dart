import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String imagepic;
  final String text1;
  final String text2;
  
  const BookCard({super.key, required this.imagepic, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imagepic),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
              width: 150,
              child: Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF484848),
                ),
              ),
            ),
          const SizedBox(height: 5,),
          SizedBox(
              width: 150,
              child: Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            )
        ],
    );
  }
}