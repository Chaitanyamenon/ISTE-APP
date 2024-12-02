import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            const Text(
              'WELCOME TO ISTE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Logo
            Image.asset(
              'assets/images/iste_logo.png', // Replace with your actual logo asset path
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 30),
            // Email Text Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            // Password Text Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Login Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107), // Yellow color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 100.0),
              ),
              onPressed: () {
                // Handle login
              },
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            // Social Login Text
            const Text(
              'Log in with:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Google Login Button
            IconButton(
              icon: Image.asset(
                  'assets/images/google.jpg'), // Replace with Google logo asset path
              iconSize: 50, // Adjust size as needed
              onPressed: () {
                // Handle Google login
              },
            ),
          ],
        ),
      ),
    );
  }
}
