import 'package:flutter/material.dart';
import 'package:pretium/pages/authscreens/loginscreen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Create Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Simplify your crypto payments with us',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: 'First Name',
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: 'Last Name',
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.teal),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'Accept ',
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Create Account'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
