import 'package:flutter/material.dart';
import 'package:lego_mens_wear/models/cart_item.dart';
import 'package:lego_mens_wear/pages/product_detail_page.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.cartItems
        .fold(0, (sum, item) => sum + item.price * item.quantity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return ListTile(
                    leading: GestureDetector(
                      onTap: () async {
                        // Navigate to product detail page to select size again
                        final updatedCartItem = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                              productName: item.productName,
                              imagePath: item.imagePath,
                              price: item.price,
                            ),
                          ),
                        );

                        if (updatedCartItem != null) {
                          setState(() {
                            widget.cartItems[index] = updatedCartItem;
                          });
                        }
                      },
                      child: Image.asset(
                        item.imagePath,
                        height: 50,
                      ),
                    ),
                    title: Text(item.productName),
                    subtitle: Text(
                        'Size: ${item.size}\nPrice: \$${item.price.toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Qty: ${item.quantity}'),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              widget.cartItems.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Proceed to checkout or payment
              },
              child: Text("Place Order"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
