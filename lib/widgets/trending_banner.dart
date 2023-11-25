import 'package:flutter/material.dart';

class TrendingBanner extends StatelessWidget {
  const TrendingBanner({super.key});

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
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Top Trends',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 200),
          child: Text(
            'See all',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF484848),
            ),
          ),
        )
      ],
    );
  }
}