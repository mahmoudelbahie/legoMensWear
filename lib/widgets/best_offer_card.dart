import 'package:flutter/material.dart';
import 'package:lego_mens_wear/models/cart_item.dart';

class BestOfferCard extends StatelessWidget {
  final Function(CartItem) addToCart;

  BestOfferCard({required this.addToCart});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Best offer product details
    final String productName = 'Limited Edition Hoodie';
    final String imagePath = 'assets/images/bestoffer.png';
    final double price = 59.99;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Offer",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center, // Center the BestOfferCard
            child: Container(
              width:
                  screenWidth * 0.9, // Set the width to 90% of the screen width
              child: Card(
                elevation: 4.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imagePath,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        productName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Price: \$${price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add the best offer item to the cart
                          final CartItem bestOfferItem = CartItem(
                            productName: productName,
                            imagePath: imagePath,
                            price: price,
                            size: 'L', // Default size for now
                            quantity: 1,
                          );
                          addToCart(bestOfferItem);
                        },
                        child: Text('Add to Cart'),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
