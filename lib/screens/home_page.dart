import 'package:dr_germaine_app/screens/chat_detail.dart';
import 'package:dr_germaine_app/screens/chat_page.dart';
import 'package:dr_germaine_app/widgets/drawer_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String userRole;
  const HomePage({super.key, required this.userRole});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int pendingAppointments = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: const Text("Germaine Care"),
        actions: [
          Stack(
            clipBehavior: Clip.none, // Permet d'afficher le badge en dehors des limites du Stack
            children: [
              IconButton(
                icon: const Icon(Icons.chat),
                onPressed: () {
                  // Gestion des notifications ou chat
                },
              ),
              if (pendingAppointments > 0) // Affiche le badge uniquement s'il y a des éléments en attente
                Positioned(
                  right: 4, // Ajustez cette valeur pour le placement horizontal
                  top: -2, // Ajustez cette valeur pour le placement vertical
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 10,
                    ),
                    child: Text(
                      '$pendingAppointments',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: CustomDrawer(userRole: widget.userRole),
      body: Column(
        children: [
          // Profile section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),  // Rayon arrondi en bas à gauche
                bottomRight: Radius.circular(15.0),  // Rayon arrondi en bas à droite
              ), // Applique un rayon de bordure arrondi
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/doctor.png'), // Replace with your image path
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Germaine",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Spécialiste en pharmacie",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        " Hôpital Effoulan, Yaoundé",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    // Handle profile editing
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Upcoming appointments
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Les demandes de conseils",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(userRole: widget.userRole)));
                  },
                  child: const Text(
                    "Tout voir",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: [
                AppointmentCard(
                  name: "Tonya Burns",
                  phone: "(868)-397-7302",
                  status: "Non lu",
                  date: "February 12, 2022",
                  subject: "Saignements anormaux",
                  country: "France",
                  statusColor: Colors.orange,
                  userRole: widget.userRole,
                ),
                AppointmentCard(
                  name: "Charlie Black",
                  phone: "(226)-571-2489",
                  status: "Non lu",
                  date: "February 12, 2022",
                  subject: "Douleur persistante",
                  country: "Kenya",
                  statusColor: Colors.orange,
                  userRole: widget.userRole,
                ),
                AppointmentCard(
                  name: "Martha West",
                  phone: "(452)-950-5986",
                  status: "Lu",
                  date: "February 12, 2022",
                  country: "Cameroun",
                  subject: "Douleurs articulaires ou gonflement",
                  statusColor: Colors.green,
                  userRole: widget.userRole,
                ),
                AppointmentCard(
                  name: "Charlie Black",
                  phone: "(226)-571-2489",
                  status: "Lu",
                  date: "February 12, 2022",
                  subject: "Perte de poids inexpliquée",
                  country: "RDC",
                  statusColor: Colors.green,
                  userRole: widget.userRole,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String name;
  final String phone;
  final String status;
  final String date;
  final String subject;
  final String country;
  final Color statusColor;
  final String userRole;

  const AppointmentCard({super.key,
    required this.name,
    required this.phone,
    required this.status,
    required this.date,
    required this.subject,
    required this.country,
    required this.statusColor,
    required this.userRole,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(userRole: userRole)));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/patient.jpg'), // Remplacer par votre image
          ),
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(phone),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.teal, size: 16), // Icône de localisation
                  const SizedBox(width: 4), // Espacement entre l'icône et le texte
                  Text(
                    country,
                    style: const TextStyle(fontSize: 14), // Style pour harmoniser le texte
                  ),
                ],
              ),
              Text(subject, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              const SizedBox(width: 4),
              Text(date, style: const TextStyle(fontSize: 12,)),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status,
                style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}