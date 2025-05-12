import 'package:flutter_task_catalift/data/local_data/local_data_service.dart';
import 'package:flutter_task_catalift/models/course_model.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  //local data intance
  final LocalDataService _localDataService;

  //constructure
  HomeController(this._localDataService);

  //variables
  final RxList<CourseModel> allCourses = RxList<CourseModel>([]);

 

  //method to get all courses
  void getCourses() {
    //print calling
    allCourses.value = _localDataService.getCourses();
  }
}
