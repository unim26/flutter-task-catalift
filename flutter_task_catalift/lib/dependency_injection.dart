import 'package:flutter_task_catalift/data/local_data/local_data_service.dart';
import 'package:flutter_task_catalift/features/bookmarkCourses/controller/bookmark_controller.dart';
import 'package:flutter_task_catalift/features/cart/controller/cart_controller.dart';
import 'package:flutter_task_catalift/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static init() {
    //loacl data service
    final LocalDataService localDataService = LocalDataService();
    //home controller
    Get.put(HomeController(localDataService));

    //bookmark controller
    Get.put(BookmarkController());

    //cart controller
    Get.put(CartController());
  }
}
