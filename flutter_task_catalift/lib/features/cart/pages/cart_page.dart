import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/features/cart/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  // controller
  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Cart',
            style: textTheme.titleLarge!.copyWith(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        body: Obx(() {
          final cartItems = _cartController.cartItems;

          return Column(
            children: [
              // Cart items list
              Expanded(
                child:
                    cartItems.isEmpty
                        ? Center(
                          child: Text(
                            'Your cart is empty',
                            style: textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            ),
                          ),
                        )
                        : ListView.builder(
                          itemCount: cartItems.length,
                          padding: const EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            final course = cartItems[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                tileColor: Colors.grey.shade100,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    course.coverImage,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  course.courseName,
                                  style: textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Rs. ${course.coursePrice}",
                                  style: textTheme.labelLarge!.copyWith(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed:
                                      () => _cartController.removeFromCart(
                                        course,
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
              ),

              // Total and Pay button
              if (cartItems.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black12,
                        offset: Offset(0, -1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // total price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total:", style: textTheme.labelLarge),
                          Text(
                            "Rs. ${_cartController.totalPrice.toStringAsFixed(2)}",
                            style: textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ],
                      ),

                      // Pay Now button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade900,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Pay Now",
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
