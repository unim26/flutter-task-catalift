import 'package:flutter_task_catalift/core/constants/app_strings.dart';
import 'package:flutter_task_catalift/models/course_model.dart';

class LocalDataService {
  //course list
  final List<CourseModel> cousreList = <CourseModel>[
    //1st course
    CourseModel(
      courseDetail: AppStrings.dummyCousreDetail,
      courseName: 'Artificial Intelligence',
      coverImage: 'assets/images/artificial_img.jpeg',
      coursePrice: 1500,
      enrolledUser: 8374,
      rating: 4.5,
    ),

    //2nd course
    CourseModel(
      courseDetail: AppStrings.dummyCousreDetail,
      coverImage: 'assets/images/ai_cover_img.jpeg',
      courseName: 'UI/UX',
      coursePrice: 1500,
      enrolledUser: 6000,
      rating: 3.0,
    ),

    //3rd course
    CourseModel(
      courseDetail: AppStrings.dummyCousreDetail,
      coverImage: 'assets/images/computer_engineering_cover_img.jpeg',
      courseName: 'Computer Engineering',
      coursePrice: 1500,
      enrolledUser: 4000,
      rating: 4.0,
    ),

    //5rd course
    CourseModel(
      courseDetail: AppStrings.dummyCousreDetail,
      coverImage: 'assets/images/artificial_img.jpeg',
      courseName: 'Artificial engineering',
      coursePrice: 1500,
      enrolledUser: 4000,
      rating: 4.0,
    ),
    //4rd course
    CourseModel(
      courseDetail: AppStrings.dummyCousreDetail,
      coverImage: 'assets/images/computer_engineering_cover_img.jpeg',
      courseName: 'Computer Engineering',
      coursePrice: 1500,
      enrolledUser: 4000,
      rating: 4.0,
    ),
  ];

  List<CourseModel> getCourses() {
    return cousreList;
  }
}
