import 'package:dr_germaine_app/screens/login_page.dart';
import 'package:dr_germaine_app/widgets/drawer_nav.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userRole;
  const ProfilePage({super.key, required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(userRole: userRole),
      appBar: AppBar(
        title: const Text(
          'Profil',  // Text title in the center
          textAlign: TextAlign.justify,  // Center the title text
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,  // Set the AppBar background color to blue
        elevation: 0,  // Optionally remove shadow
        iconTheme: const IconThemeData(
          color: Colors.white,  // White hamburger icon
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              'Stephane Ngeukam',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'stephanengeukam@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Aide'),
              onTap: () {
                // Navigate to Help page (you can implement this page)
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Se déconnecter'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        )
        ,
      ),
    );
  }
}