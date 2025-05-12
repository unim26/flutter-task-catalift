import 'package:flutter_task_catalift/models/course_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // variables
  RxList<CourseModel> cartItems = <CourseModel>[].obs;

  // method to add to cart
  void addToCart(CourseModel course) {
    if (!cartItems.contains(course)) {
      cartItems.add(course);
    }
  }

  // method to remove from cart
  void removeFromCart(CourseModel course) {
    cartItems.remove(course);
  }

  // check if item is already in cart
  bool isInCart(CourseModel course) {
    return cartItems.contains(course);
  }

  // get total price
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.coursePrice);
  }
}
