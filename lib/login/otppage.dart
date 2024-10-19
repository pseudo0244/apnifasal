import 'package:flutter/material.dart';
import 'package:apnifasaladmin/homepage/mainpage.dart'; // Import the main page for navigation

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back button functionality
          },
        ),
        title: Text('OTP Verification'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // Set icon/text color to black
        elevation: 0, // Remove AppBar shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),

            // "Enter your 4-digit code" text
            Text(
              'Enter your 4-digit code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Code input label
            Text(
              'Code',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 10),

            // OTP input field
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 4, // Limit to 4 digits
              style: TextStyle(letterSpacing: 32, fontSize: 24),
              decoration: InputDecoration(
                hintText: '- - - -',
                counterText: '', // Hide the character counter
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Resend Code Text Button
            GestureDetector(
              onTap: () {
                // Implement resend code logic
              },
              child: Text(
                'Resend Code',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),

            // Circular Arrow Button
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Navigation to Main Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
