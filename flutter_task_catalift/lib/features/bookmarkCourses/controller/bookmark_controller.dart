import 'package:flutter_task_catalift/models/course_model.dart';
import 'package:get/get.dart';

class BookmarkController extends GetxController {
  // variables
  RxList<CourseModel> bookmarkedCoursesList = <CourseModel>[].obs;

  // method to add a bookmark
  void bookmarkCourse(CourseModel course) {
    if (!bookmarkedCoursesList.contains(course)) {
      bookmarkedCoursesList.add(course);
    }else{
    bookmarkedCoursesList.remove(course);

    }
  }

  // method to remove a bookmark
  void removeBookmark(CourseModel course) {
    bookmarkedCoursesList.remove(course);
  }

  //check if a course is bookmarked
  bool isBookmarked(CourseModel course) {
    return bookmarkedCoursesList.contains(course);
  }


}
