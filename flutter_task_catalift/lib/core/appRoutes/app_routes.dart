import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/features/bookmarkCourses/pages/bookmark_page.dart';
import 'package:flutter_task_catalift/features/cart/pages/cart_page.dart';
import 'package:flutter_task_catalift/features/home/pages/course_detail_page.dart';
import 'package:flutter_task_catalift/features/home/pages/home_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {

    //home page
    '/':(_)=> HomePage(),

    //bookmark page
    '/bookmark-page':(_)=> BookmarkPage(),

    //course detail page
    '/course-detail-page':(_)=> CourseDetailPage(),

    //cart page
    '/cart-page':(_)=> CartPage(),
  };
}
