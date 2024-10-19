import 'package:flutter/material.dart';

class PaymentDashboardPage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        name: 'Suresh',
        date: 'March 08',
        amount: 1800,
        category: 'Grocery store'),
    Transaction(
        name: 'Yogaraj', date: 'March 07', amount: 3000, category: 'Hostel'),
    Transaction(
        name: 'Naman',
        date: 'March 05',
        amount: 1500,
        category: 'Grocery store'),
    Transaction(
        name: 'Anirudh', date: 'March 02', amount: 500, category: 'Restaurant'),
    Transaction(
        name: 'Aman',
        date: 'March 02',
        amount: 2000,
        category: 'Grocery store'),
    Transaction(
        name: 'Avanti', date: 'March 02', amount: 2800, category: 'Hostel'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.greenAccent.shade100, Colors.blue.shade100],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Income',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54),
                ),
                SizedBox(height: 10),
                Text(
                  '₹25,000',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Transactions',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '25 Transactions',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: transactions.length,
                              itemBuilder: (context, index) {
                                final transaction = transactions[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    child: Text(
                                      transaction.name[0],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  title: Text(transaction.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                      '${transaction.date}\n${transaction.category}'),
                                  trailing: Text('₹${transaction.amount}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  isThreeLine: true,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Transaction {
  final String name;
  final String date;
  final int amount;
  final String category;

  Transaction({
    required this.name,
    required this.date,
    required this.amount,
    required this.category,
  });
}
