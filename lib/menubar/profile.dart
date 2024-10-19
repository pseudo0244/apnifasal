import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture and Name
            ProfileHeader(),
            SizedBox(height: 20),
            // Contact Info
            ProfileInfoCard(
              icon: Icons.phone,
              title: 'Phone Number',
              subtitle: '+91 9876543210',
            ),
            ProfileInfoCard(
              icon: Icons.account_balance,
              title: 'Bank Account',
              subtitle: 'Account Number: 41476717080',
            ),
            ProfileInfoCard(
              icon: Icons.home,
              title: 'Address',
              subtitle:
                  '3rd Floor, Site No. 74 , Mass Complex 15th Cross Road Sarakki, Industrial Area, 3rd Phase, J. P. Nagar, Bengaluru, Karnataka 560078',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
              'assets/apnifasal_black_logo.png'), // Replace with actual image path
        ),
        SizedBox(height: 10),
        Text(
          'Suresh',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          'Farmer',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  ProfileInfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
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
        subtitle: Text(subtitle),
      ),
    );
  }
}
