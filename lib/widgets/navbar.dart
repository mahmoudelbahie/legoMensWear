import 'package:flutter/material.dart';
import 'package:lego_mens_wear/models/cart_item.dart';
import 'package:lego_mens_wear/pages/cart_page.dart';

class Navbar extends StatelessWidget {
  final List<CartItem> cartItems;

  Navbar({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.png', height: 50),
              SizedBox(width: 10),
              Text(
                'LEGO MEN\'S WEAR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text('Home'),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/men');
                },
                child: Text('Men'),
              ),
              SizedBox(width: 20),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(cartItems: cartItems),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart, size: 28),
                  ),
                  if (cartItems.isNotEmpty)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Text(
                          '${cartItems.length}', // Correctly show number of items
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
