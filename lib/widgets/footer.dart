import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        children: [
          Text('lego Street Wear - lego_streetwear@gmail.com'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook),
              SizedBox(width: 10),
              Icon(Icons.tiktok),
              SizedBox(width: 10),
              Icon(Icons.email),
            ],
          ),
          SizedBox(height: 10),
          Text('© LEGO MEN\'S WEAR 2023'),
        ],
      ),
    );
  }
}
