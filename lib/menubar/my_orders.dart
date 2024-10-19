import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Sample orders
            OrderCard(
              retailerName: 'Sharma Agro Supplies',
              orderDate: '2024-08-15',
              orderStatus: 'Shipped',
              totalAmount: '₹5,200',
            ),
            OrderCard(
              retailerName: 'Deshmukh Seeds & Fertilizers',
              orderDate: '2024-08-10',
              orderStatus: 'Delivered',
              totalAmount: '₹3,800',
            ),
            OrderCard(
              retailerName: 'Patel Agro Store',
              orderDate: '2024-08-05',
              orderStatus: 'Pending',
              totalAmount: '₹2,500',
            ),
            // Add more OrderCards as needed
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String retailerName;
  final String orderDate;
  final String orderStatus;
  final String totalAmount;

  OrderCard({
    required this.retailerName,
    required this.orderDate,
    required this.orderStatus,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          retailerName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Date: $orderDate'),
            Text('Status: $orderStatus'),
            Text('Total Amount: $totalAmount'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {
            // Navigate to order detail page or show more info
          },
        ),
        onTap: () {
          // Navigate to order detail page or show more info
        },
      ),
    );
  }
}
