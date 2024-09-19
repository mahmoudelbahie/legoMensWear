import 'package:flutter/material.dart';
import 'package:lego_mens_wear/models/cart_item.dart';
import 'package:lego_mens_wear/pages/product_detail_page.dart';

class ProductGrid extends StatelessWidget {
  final List<CartItem> cartItems;
  final Function(CartItem) addToCart; // Add to cart function

  ProductGrid({required this.cartItems, required this.addToCart});

  final List<String> products = [
    'assets/images/product1.png',
    'assets/images/product2.png',
    'assets/images/product3.png',
    'assets/images/background.png',
  ];

  final List<String> productNames = [
    'Jacket',
    'Hoodie',
    'Pants',
    'Shirt',
  ];

  final List<double> productPrices = [
    150.0,
    200.0,
    120.0,
    180.0,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            final selectedCartItem = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  productName: productNames[index],
                  imagePath: products[index],
                  price: productPrices[index],
                ),
              ),
            );

            if (selectedCartItem != null) {
              addToCart(selectedCartItem); // Add item to the cart
            }
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      products[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    productNames[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\$${productPrices[index]}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
