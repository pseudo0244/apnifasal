import 'package:flutter/material.dart';

class KisaanCommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Community'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Implement create post functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Sample posts
            PostCard(
              userName: 'Suresh',
              postTime: '2 hours ago',
              postContent:
                  'Just harvested my first crop of tomatoes! 🍅🌱 #FarmingLife',
              likes: 120,
              comments: 15,
            ),
            PostCard(
              userName: 'Naresh',
              postTime: '1 day ago',
              postContent:
                  'Looking for advice on organic pest control. Any tips?',
              likes: 85,
              comments: 25,
            ),
            // Add more PostCards as needed
            PostCard(
              userName: 'Ramu',
              postTime: '1 day ago',
              postContent: 'How much does a new borewell cost?',
              likes: 30,
              comments: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String userName;
  final String postTime;
  final String postContent;
  final int likes;
  final int comments;

  PostCard({
    required this.userName,
    required this.postTime,
    required this.postContent,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                      'assets/apnifasal_white_logo.png'), // Replace with actual user image
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      postTime,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              postContent,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, color: Colors.blue),
                    SizedBox(width: 5),
                    Text('$likes'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment_outlined, color: Colors.grey),
                    SizedBox(width: 5),
                    Text('$comments'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
