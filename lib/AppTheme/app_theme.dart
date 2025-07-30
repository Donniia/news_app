import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: const Color(0xff39A552),
      appBarTheme: const AppBarTheme(
        color: Color(0xff39A552),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          bodyLarge: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color(0xff4F5A69)),
          ),
        bodyMedium: GoogleFonts.exo(
          textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        )
      ),
  );
}
