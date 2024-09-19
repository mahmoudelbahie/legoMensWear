import 'package:flutter/material.dart';
import 'package:lego_mens_wear/models/cart_item.dart';
import 'package:lego_mens_wear/pages/product_detail_page.dart';

class OffersSection extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(CartItem) addToCart;

  OffersSection({required this.cartItems, required this.addToCart});

  final List<String> offers = [
    'assets/images/product4.png',
    'assets/images/product5.png',
    'assets/images/product6.png',
  ];

  final List<String> offerNames = [
    'Cool Casual Hoodie',
    'Stylish Zip-up Hoodie',
    'Comfortable Pullover Hoodie',
  ];

  final List<double> offerPrices = [
    89.99,
    99.99,
    79.99,
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Special Offers",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 250, // Increased height for larger cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  final selectedCartItem = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        productName: offerNames[index],
                        imagePath: offers[index],
                        price: offerPrices[index],
                      ),
                    ),
                  );
                  if (selectedCartItem != null) {
                    addToCart(selectedCartItem);
                  }
                },
                child: Container(
                  width: screenWidth /
                      3, // Dynamically set width to 1/3 of screen width
                  margin: EdgeInsets.symmetric(
                      horizontal: 5), // Minimal margin for spacing
                  child: Card(
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              offers[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            offerNames[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '\$${offerPrices[index].toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
