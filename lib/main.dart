import 'package:flutter/material.dart';
import 'package:lego_mens_wear/pages/home_page.dart';
import 'package:lego_mens_wear/models/cart_item.dart';
import 'package:lego_mens_wear/pages/cart_page.dart';

void main() {
  runApp(LegoMensWearApp());
}

class LegoMensWearApp extends StatefulWidget {
  @override
  _LegoMensWearAppState createState() => _LegoMensWearAppState();
}

class _LegoMensWearAppState extends State<LegoMensWearApp> {
  List<CartItem> cartItems = [];

  void addToCart(CartItem item) {
    setState(() {
      cartItems.add(item); // Update the cart items list
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lego Men\'s Wear',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(
          cartItems: cartItems,
          addToCart: addToCart), // Pass addToCart function
      routes: {
        '/cart': (context) => CartPage(cartItems: cartItems),
      },
    );
  }
}
