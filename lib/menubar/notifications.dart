import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationCard(
              icon: Icons.store,
              title: 'New Retailer Joined',
              subtitle: 'A new retailer has joined the community.',
              time: '2 hours ago',
            ),
            NotificationCard(
              icon: Icons.discount,
              title: 'Special Discount Offer',
              subtitle: 'Get 20% off on seeds from My Seed store.',
              time: '5 hours ago',
            ),
            NotificationCard(
              icon: Icons.forum,
              title: 'New Forum Post',
              subtitle:
                  'A new post has been added in the farming techniques forum.',
              time: '1 day ago',
            ),
            NotificationCard(
              icon: Icons.cloud,
              title: 'Weather Alert',
              subtitle: 'Heavy rainfall expected in your area tomorrow.',
              time: '2 days ago',
            ),
            // Add more notifications as needed
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  NotificationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
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
        leading: Icon(
          icon,
          color: Colors.green,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            // Implement action for more options
          },
        ),
        onTap: () {
          // Implement navigation or action on tap
        },
      ),
    );
  }
}
