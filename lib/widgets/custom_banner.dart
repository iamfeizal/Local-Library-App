import 'package:flutter/material.dart';

class TrendingBanner extends StatelessWidget {
  final String customText;
  const TrendingBanner({super.key, required this.customText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                customText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}