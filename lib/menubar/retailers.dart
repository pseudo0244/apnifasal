import 'package:flutter/material.dart';

class RetailersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retailers'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            SearchBar(),
            SizedBox(height: 20),
            // Retailer List
            Expanded(
              child: ListView(
                children: [
                  RetailerCard(
                    name: 'ABC Agro Store',
                    location: 'Delhi',
                    description:
                        'High-quality seeds and fertilizers available.',
                  ),
                  RetailerCard(
                    name: 'Green Growers',
                    location: 'Mumbai',
                    description: 'Organic farming products and equipment.',
                  ),
                  RetailerCard(
                    name: 'Farm Essentials',
                    location: 'Bangalore',
                    description:
                        'Comprehensive range of farming tools and supplies.',
                  ),
                  // Add more retailer cards as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search Retailers',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      ),
      onChanged: (value) {
        // Implement search functionality
      },
    );
  }
}

class RetailerCard extends StatelessWidget {
  final String name;
  final String location;
  final String description;

  RetailerCard({
    required this.name,
    required this.location,
    required this.description,
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
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.info_outline),
          onPressed: () {
            // Navigate to retailer detail page or show more info
          },
        ),
        onTap: () {
          // Navigate to retailer detail page or show more info
        },
      ),
    );
  }
}
