import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/models/course_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SimilarCourseCard extends StatelessWidget {
  const SimilarCourseCard({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * .33,
            height: size.height * .15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(course.coverImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //space
          SizedBox(height: 10),

          //course name
          Text(
            course.courseName,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 128, 1),
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),

          //course price
          Text(
            'Rs. ${course.coursePrice}',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade300,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
