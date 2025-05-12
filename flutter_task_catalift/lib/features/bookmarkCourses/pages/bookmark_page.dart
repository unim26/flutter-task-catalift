import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/features/bookmarkCourses/controller/bookmark_controller.dart';
import 'package:flutter_task_catalift/features/home/controller/home_controller.dart';
import 'package:flutter_task_catalift/features/home/widgets/course_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  //controller
  final BookmarkController _bookmarkController = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "BookMarks",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 128, 1),
            ),
          ),

          leading: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(0, 0, 128, 1),
            ),
            child: Center(
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ),
        ),

        ///bpdy
        body: Obx(() {
          if (_bookmarkController.bookmarkedCoursesList.isEmpty) {
            return Center(
              child: Text(
                "You haven't saved any courses.",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ).copyWith(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text
                  Text(
                    "Saved Courses",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  //course cards
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          _bookmarkController.bookmarkedCoursesList.length,
                      itemBuilder: (context, index) {
                        return CourseCard(
                          course:
                              _bookmarkController.bookmarkedCoursesList[index],
                          size: size,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
