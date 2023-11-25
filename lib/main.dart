import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_library_app/widgets/bottom_navbar.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      home: BottomNavBar(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xff633a88),
      splash: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 35, 8, 0),
          child: Column(
            children: [
              Icon(Icons.book_rounded, size: 150, color: Colors.white,),
              SizedBox(height: 50),
              Text(
                "Local Book Library App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "by Imam Agus Faisal",
                textAlign: TextAlign.center,
                style:
                TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      nextScreen: BottomNavBar(),
      splashIconSize: 350,
      duration: 1000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}