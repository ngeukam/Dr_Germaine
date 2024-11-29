import 'package:dr_germaine_app/screens/patient_request_page.dart';
import 'package:flutter/material.dart';
import 'package:dr_germaine_app/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false; // Pour gérer l'état de chargement

  // Méthode pour vérifier le rôle de l'utilisateur
  String checkUserRole(String email, String password) {
    if (email == '' || password == '') {
      return 'empty'; // Si l'email ou le mot de passe est vide
    }

    // Exemple de logique de vérification des rôles
    if (email == 'doctor@gmail.com' && password == '123456') {
      return 'doctor'; // Rôle docteur
    } else if (email == 'patient@gmail.com' && password == '123456') {
      return 'patient'; // Rôle patient
    } else {
      return 'invalid'; // Identifiants invalides
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = ''; // Vous pouvez remplacer par un contrôleur de texte réel
    String password = ''; // Vous pouvez remplacer par un contrôleur de texte réel

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Container as AppBar-like header with logo
          Container(
            width: double.infinity, // Take full width
            height: 200, // Height of the header
            decoration: const BoxDecoration(
              color: Colors.teal, // Background color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ), // Rounded corners at the bottom
            ),
            alignment: Alignment.center, // Center the content inside the container
            child:  Image.asset(
              'assets/logo2.png', // Path to your logo image
              height: 90.0, // Adjust the size of the logo
            ),
          ),

          // Sign-in Form Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SE CONNECTER',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Bienvenue!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Email TextField
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.teal,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password TextField
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.teal,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true; // Démarrer le chargement
                          });

                          await Future.delayed(const Duration(seconds: 2)); // Simuler un délai pour le chargement

                          String role = checkUserRole(email, password);

                          setState(() {
                            _isLoading = false; // Arrêter le chargement
                          });

                          // Gestion des rôles et redirection
                          if (role == 'empty') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Champs obligatoires'), backgroundColor: Colors.red),
                            );
                          } else if (role == 'invalid') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Identifiants invalides'), backgroundColor: Colors.red),
                            );
                          } else if (role == 'doctor') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(userRole: 'doctor'),
                              ),
                            );
                          } else if (role == 'patient') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PatientRequestPage(userRole: 'patient'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text(
                          'SE CONNECTER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Forgot Password and Sign-Up
                    TextButton(
                      onPressed: () {
                        // Forgot password action
                      },
                      child: const Text(
                        'Mot de passe oublié?',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Pas de compte? "),
                        GestureDetector(
                          onTap: () {
                            // Navigate to sign-up screen
                          },
                          child: const Text(
                            'S\'ENREGISTRER',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
