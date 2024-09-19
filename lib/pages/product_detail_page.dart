import 'package:flutter/material.dart';
import 'package:lego_mens_wear/models/cart_item.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName;
  final String imagePath;
  final double price;

  const ProductDetailPage({
    Key? key,
    required this.productName,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product name and image
            Text(
              widget.productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset(
              widget.imagePath,
              height: 200,
            ),
            SizedBox(height: 20),
            // Product price
            Text(
              'Price: \$${widget.price.toString()}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Quantity selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Available sizes
            Text(
              'Available Sizes',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: ['S', 'M', 'L', 'XL', 'XXL'].map((size) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                  child: Chip(
                    label: Text(size),
                    backgroundColor: selectedSize == size
                        ? Colors.blueAccent
                        : Colors.grey[300],
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            // Add to Cart Button
            ElevatedButton(
              onPressed: selectedSize == null
                  ? null
                  : () {
                      final cartItem = CartItem(
                        productName: widget.productName,
                        imagePath: widget.imagePath,
                        price: widget.price,
                        size: selectedSize!,
                        quantity: quantity,
                      );
                      Navigator.pop(context, cartItem);
                    },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
