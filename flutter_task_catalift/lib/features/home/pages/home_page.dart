import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/features/home/controller/home_controller.dart';
import 'package:flutter_task_catalift/features/home/widgets/course_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //controller
  final HomeController _homeController = Get.find<HomeController>();
  @override
  void initState() {
    _homeController.getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Get.toNamed('/bookmark-page'),
              icon: Icon(Icons.bookmark_outline),
            ),
            IconButton(
              onPressed: () => Get.toNamed('/cart-page'),
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ],
          backgroundColor: Colors.transparent,
          title: Text(
            "Home",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        ///bpdy
        body: Obx(() {
          if (_homeController.allCourses.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //text
                  Text(
                    "All Courses",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  //course cards
                  Expanded(
                    child: ListView.builder(
                      itemCount: _homeController.allCourses.length,
                      itemBuilder: (context, index) {
                        return CourseCard(
                          course: _homeController.allCourses[index],
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
