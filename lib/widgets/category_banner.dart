import 'package:flutter/material.dart';

class CategoryBanner extends StatelessWidget {
  const CategoryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFE65C4F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'History',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE9EEF4),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFE65C4F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Fantasy',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE9EEF4),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFE65C4F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Romance',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE9EEF4),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFE65C4F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Tamil',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE9EEF4),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFE65C4F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Korean',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE9EEF4),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Color(0xFFE65C4F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Technology',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFE9EEF4),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}