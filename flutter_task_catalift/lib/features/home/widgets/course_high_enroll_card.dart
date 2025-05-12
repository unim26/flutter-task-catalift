import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseHighEnrollCard extends StatelessWidget {
  const CourseHighEnrollCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(6),
          width: size.width * .37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.green.shade100,
          ),
          child: Center(
            child: Text(
              "Highly Enrolled",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontFamily: GoogleFonts.roboto().fontFamily,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
