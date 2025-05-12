import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/features/bookmarkCourses/controller/bookmark_controller.dart';
import 'package:flutter_task_catalift/models/course_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  CourseCard({super.key, required this.course, required this.size});

  final CourseModel course;
  final Size size;

  final BookmarkController _bookmarkController = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: ()=> Get.toNamed('/course-detail-page',arguments: {'course':course}),
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: size.height * .22,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: .8,
              image: AssetImage(course.coverImage),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              //bokkmark icon
              Positioned(
                right: 13,
                top: 5,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () => _bookmarkController.bookmarkCourse(course),
                      icon:
                          _bookmarkController.isBookmarked(course)
                              ? Icon(Icons.bookmark)
                              : Icon(Icons.bookmark_outline_sharp),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              //course detail
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).copyWith(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withValues(alpha: .6)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //course name
                      Text(
                        course.courseName,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //price
                      Text(
                        ' Rs. ${course.coursePrice.toString()}',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
