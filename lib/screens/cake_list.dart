import 'package:flutter/material.dart';

class Cake {
  final String name;
  final String imageUrl;
  final double price;
  final String size;

  Cake({required this.name, required this.imageUrl, required this.price, required this.size});
}

class HomePage extends StatelessWidget {
  final List<Cake> cakes = [
    Cake(name: 'Chocolate Cake', imageUrl: 'assets/chocolate_cake.jpg', price: 12.99, size: '8"'),
    Cake(name: 'Strawberry Cake', imageUrl: 'assets/strawberry_cake.jpg', price: 15.99, size: '10"'),
    Cake(name: 'Vanilla Cake', imageUrl: 'assets/vanilla_cake.jpg', price: 10.99, size: '6"'),
    // Add more cakes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cakes'),
      ),
      body: ListView.builder(
        itemCount: cakes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle when a cake is clicked
              print('Clicked on ${cakes[index].name}');
            },
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(
                      cakes[index].imageUrl,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      cakes[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Price: \$${cakes[index].price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Size: ${cakes[index].size}"',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
