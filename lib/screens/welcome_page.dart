import 'package:dr_germaine_app/screens/login_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo1.png', // Path to your logo image
              height: 90.0, // Adjust the size of the logo
            ),
            SizedBox(height: 20),
            const Text(
              "Bienvenue chez Dr Germaine",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Restez en contact avec votre docteur.",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(), // Replace with your next screen
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Use backgroundColor instead of primary
                foregroundColor: Colors.teal, // Use foregroundColor instead of onPrimary

                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
              ),
              child: const Text(
                "Se Connecter",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                // Navigate to the sign-up screen
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.teal, // Use backgroundColor instead of primary
                foregroundColor: Colors.white,
                side: const BorderSide( // Add a white border
                  color: Colors.white,
                  width: 1.0, // Adjust border width
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
              ),
              child: const Text(
                "S'enregistrer",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
