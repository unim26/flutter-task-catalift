import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppButton {
  //outline button
  static Widget outlineButton(BuildContext context, {required String bName,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(0, 0, 128, .3),
          border: Border.all(color: Color.fromRGBO(0, 0, 128, 1), width: 1),
        ),
        child: Center(
          child: Text(
            bName,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.roboto().fontFamily,
              color: Color.fromRGBO(0, 0, 128, 1),
            ),
          ),
        ),
      ),
    );
  }

  //normal button
  static Widget normalButton(BuildContext context, {required String bName,void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(0, 0, 128, 1),
          border: Border.all(color: Color.fromRGBO(0, 0, 128, 1), width: 1),
        ),
        child: Center(
          child: Text(
            bName,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.roboto().fontFamily,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
