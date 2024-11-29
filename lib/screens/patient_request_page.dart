import 'package:dr_germaine_app/widgets/drawer_nav.dart';
import 'package:flutter/material.dart';

class PatientRequestPage extends StatefulWidget {
  final String userRole;
  const PatientRequestPage({super.key, required this.userRole});

  @override
  State<PatientRequestPage> createState() => _PatientRequestPageState();
}

class _PatientRequestPageState extends State<PatientRequestPage> {
  final List<String> categories = [
    "Douleur persistante",
    "Fièvre continue ou récurrente",
    "Toux persistante ou difficultés respiratoires",
    "Essoufflement ou oppression dans la poitrine",
    "Fatigue extrême ou épuisement",
    "Perte d'appétit ou incapacité à manger",
    "Nausées et vomissements fréquents",
    "Diarrhée sévère ou prolongée",
    "Saignements anormaux",
    "Éruptions cutanées ou démangeaisons",
    "Confusion ou désorientation mentale",
    "Changement dans les habitudes urinaires",
    "Douleurs articulaires ou gonflement",
    "Perte de poids inexpliquée",
    "Problèmes de vision ou douleur oculaire",
    "Engourdissements ou fourmillements",
    "Perte de mémoire ou difficultés cognitives",
    "Sensation de malaise général",
    "Problèmes de sommeil persistants",
    "Autres...",
  ];

  String selectedCategory = ""; // Pour stocker la catégorie sélectionnée
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Demandez un conseil",
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),

        actions:[
            IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {
                // Gestion des notifications ou chat
              },
            )],
        iconTheme: const IconThemeData(
          color: Colors.white,  // White hamburger icon
        ),
      ),
      drawer: CustomDrawer(userRole: widget.userRole),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choisissez une catégorie :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                    child: Card(
                      color: selectedCategory == categories[index]
                          ? Colors.teal.withOpacity(0.2)
                          : Colors.white,
                      child: ListTile(
                        title: Text(categories[index]),
                        trailing: selectedCategory == categories[index]
                            ? const Icon(Icons.check, color: Colors.teal)
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Décrivez votre problème :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Écrivez votre message ici...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {
                  if (selectedCategory.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Veuillez sélectionner une catégorie."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (messageController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Veuillez écrire un message."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // Envoyer la demande
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Votre demande sur '$selectedCategory' a été envoyée."),
                        backgroundColor: Colors.green,
                      ),
                    );
                    messageController.clear();
                    setState(() {
                      selectedCategory = "";
                    });
                  }
                },
                child: const Text(
                  "Envoyer",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
