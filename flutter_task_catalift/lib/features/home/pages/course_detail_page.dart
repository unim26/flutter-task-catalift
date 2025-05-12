import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/core/utils/myAppButton/my_app_button.dart';
import 'package:flutter_task_catalift/features/bookmarkCourses/controller/bookmark_controller.dart';
import 'package:flutter_task_catalift/features/cart/controller/cart_controller.dart';
import 'package:flutter_task_catalift/features/home/controller/home_controller.dart';
import 'package:flutter_task_catalift/features/home/pages/similar_course_card.dart';
import 'package:flutter_task_catalift/features/home/widgets/course_high_enroll_card.dart';
import 'package:flutter_task_catalift/models/course_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseDetailPage extends StatelessWidget {
  CourseDetailPage({super.key});

  //variable
  final CourseModel course = Get.arguments['course'];

  //controller
  final HomeController _homeController = Get.find<HomeController>();
  final BookmarkController _bookmarkController = Get.find<BookmarkController>();
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => _bookmarkController.bookmarkCourse(course),
              icon: Obx(() {
                return Icon(
                  _bookmarkController.isBookmarked(course)
                      ? Icons.bookmark
                      : Icons.bookmark_outline,
                );
              }),
            ),
          ],
          toolbarHeight: 60,
          leadingWidth: 100,
          backgroundColor: Colors.transparent,
          title: Text(
            "Course Details",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: GoogleFonts.roboto().fontFamily,
              color: Color.fromRGBO(0, 0, 128, 1),
            ),
          ),

          leading: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.only(left: 5),
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

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //image
              Container(
                width: double.infinity,
                height: size.height * .3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(course.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //mark for high enroll detail
              course.enrolledUser > 4000 ? CourseHighEnrollCard() : Container(),

              //space
              SizedBox(height: 10),

              //course detail
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //course anme rating and enrolled users
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //course name
                        Text(
                          course.courseName,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium!.copyWith(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 0, 128, 1),
                          ),
                        ),

                        //rating and enrolled user
                        Row(
                          children: [
                            //rating
                            Row(
                              children: [
                                //start
                                Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.yellow.shade700,
                                ),

                                //rating
                                Text(
                                  course.rating.toString(),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                  ),
                                ),
                              ],
                            ),

                            //space
                            SizedBox(width: 10),

                            //divider
                            Container(
                              width: 2,
                              height: 20,
                              color: Colors.grey.shade600,
                            ),

                            //space
                            SizedBox(width: 10),
                            //user enrolled
                            Text(
                              '${course.enrolledUser} Enrolled',
                              style: Theme.of(
                                context,
                              ).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //price
                    Text(
                      "Rs. ${course.coursePrice}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey.shade300,
                      ),
                    ),
                  ],
                ),
              ),

              //space
              SizedBox(height: 20),
              //course description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  course.courseDetail,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ),

              //space
              SizedBox(height: 20),

              //buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //addto cart
                  Obx( () {
                      return MyAppButton.outlineButton(
                        context,
                        bName:
                            _cartController.isInCart(course)
                                ? 'Added to cart'
                                : 'Add to cart',
                        onTap: () {
                          if (!_cartController.isInCart(course)) {
                            _cartController.addToCart(course);
                          }
                        },
                      );
                    }
                  ),
                  //buy now
                  MyAppButton.normalButton(context, bName: 'Buy Now'),
                ],
              ),

              //space
              SizedBox(height: 20),

              //similar courses
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //similar courses
                    Text(
                      'Similar Courses',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),

                    //see all
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                  ],
                ),
              ),

              //space
              SizedBox(height: 10),

              //similar course card
              Obx(() {
                return SizedBox(
                  height: 180, // or whatever height your card needs
                  child: ListView.builder(
                    itemCount: _homeController.allCourses.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SimilarCourseCard(
                        course: _homeController.allCourses[index],
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
