import 'package:dr_germaine_app/screens/login_page.dart';
import 'package:dr_germaine_app/screens/patient_chat_page.dart';
import 'package:dr_germaine_app/screens/patient_request_page.dart';
import 'package:flutter/material.dart';
import 'package:dr_germaine_app/screens/home_page.dart';
import 'package:dr_germaine_app/screens/chat_page.dart';
import 'package:dr_germaine_app/screens/profile_page.dart';

class CustomDrawer extends StatelessWidget {
  final String userRole; // Rôle de l'utilisateur

  const CustomDrawer({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              // Redirige en fonction du rôle
              if (userRole == 'doctor') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage(userRole: 'doctor')),
                );
              } else if (userRole == 'patient') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientRequestPage(userRole: 'patient')),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Conversations'),
            onTap: () {
              if (userRole == 'doctor') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage(userRole: 'doctor')),
                );
              } else if (userRole == 'patient') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PatientChatPage(userRole: 'patient')),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('Profil'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(userRole: userRole)),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Se déconnecter'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
