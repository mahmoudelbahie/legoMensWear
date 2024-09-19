import 'package:flutter/material.dart';
import 'package:lego_mens_wear/widgets/navbar.dart';
import 'package:lego_mens_wear/widgets/offer_section.dart';
import 'package:lego_mens_wear/widgets/product_grid.dart';
import 'package:lego_mens_wear/widgets/footer.dart';
import 'package:lego_mens_wear/widgets/best_offer_card.dart';
import 'package:lego_mens_wear/models/cart_item.dart';

class HomePage extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(CartItem) addToCart; // Add to cart function

  HomePage({required this.cartItems, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Navbar(cartItems: cartItems), // Pass cartItems to Navbar
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BestOfferCard(addToCart: addToCart), // Best Offer Card at the top
            SizedBox(height: 20),
            OffersSection(
                cartItems: cartItems,
                addToCart: addToCart), // Special Offers Section
            SizedBox(height: 20),
            ProductGrid(
                cartItems: cartItems, addToCart: addToCart), // Product Grid
            Footer(),
          ],
        ),
      ),
    );
  }
}
