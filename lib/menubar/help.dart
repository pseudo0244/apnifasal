import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // FAQs Section
            SectionTitle(title: 'Frequently Asked Questions'),
            FAQCard(
              question: 'How can I contact customer support?',
              answer:
                  'You can contact customer support via phone at +91 9876543210 or email at support@apnifasal.com.',
            ),
            FAQCard(
              question: 'What should I do if I forget my password?',
              answer:
                  'You can reset your password using the "Forgot Password" link on the login page.',
            ),
            // Add more FAQs as needed

            SizedBox(height: 20),

            // Contact Support Section
            SectionTitle(title: 'Contact Support'),
            SupportCard(
              icon: Icons.phone,
              title: 'Phone Support',
              subtitle: '+91 9876543210',
            ),
            SupportCard(
              icon: Icons.email,
              title: 'Email Support',
              subtitle: 'support@apnifasal.com',
            ),
            // Add more support options if needed

            SizedBox(height: 20),

            // Useful Links Section
            SectionTitle(title: 'Useful Links'),
            UsefulLinkCard(
              title: 'Farming Techniques Guide',
              url: 'https://example.com/farming-techniques',
            ),
            UsefulLinkCard(
              title: 'Weather Forecast',
              url: 'https://example.com/weather-forecast',
            ),
            // Add more useful links if needed

            SizedBox(height: 20),

            // Quick Tips Section
            SectionTitle(title: 'Quick Tips'),
            QuickTipCard(
              tip: 'Ensure proper irrigation to improve crop yield.',
            ),
            QuickTipCard(
              tip: 'Use organic fertilizers for healthier soil.',
            ),
            // Add more tips if needed
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FAQCard extends StatelessWidget {
  final String question;
  final String answer;

  FAQCard({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer),
          ),
        ],
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  SupportCard({
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
        subtitle: Text(subtitle),
        onTap: () {
          // Implement action for support contact
        },
      ),
    );
  }
}

class UsefulLinkCard extends StatelessWidget {
  final String title;
  final String url;

  UsefulLinkCard({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.link),
        onTap: () {
          // Implement link opening functionality
          // e.g., launch URL with url_launcher package
        },
      ),
    );
  }
}

class QuickTipCard extends StatelessWidget {
  final String tip;

  QuickTipCard({required this.tip});

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
        child: Text(
          tip,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
