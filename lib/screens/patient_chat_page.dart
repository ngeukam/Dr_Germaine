import 'package:dr_germaine_app/models/chatdoctor_model.dart';
import 'package:dr_germaine_app/widgets/drawer_nav.dart';
import 'package:dr_germaine_app/widgets/patient_conversation_list.dart';
import 'package:flutter/material.dart';

class PatientChatPage extends StatefulWidget {
  final String userRole;
  const PatientChatPage({super.key, required this.userRole});

  @override
  _PatientChatPage createState() => _PatientChatPage();
}

class _PatientChatPage extends State<PatientChatPage> {
  final int pendingAppointments = 1;
  List<ChatDoctor> chatDoctor = [
    ChatDoctor(subject: "Douleur persistante", messageText: "J'ai tellement mal au ventre et à la tête depuis hier nuit.", time: "Now", status:"Ouverte", isMessageRead:false, statusColor:Colors.green),
    ChatDoctor(subject: "Douleurs articulaires ou gonflement", messageText: "Je me suis reveillé ce matin avec toutes mes articulations qui font mal.", time: "21 Sept", status:"Fermée", isMessageRead:true, statusColor:Colors.orange),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversations',  // Text title in the center
          textAlign: TextAlign.justify,  // Center the title text
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
        backgroundColor: Colors.teal,  // Set the AppBar background color to blue
        elevation: 0,  // Optionally remove shadow
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,  // White hamburger icon
        ),
      ),
      drawer: CustomDrawer(userRole:widget.userRole),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: chatDoctor.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return PatientConversationList(
                  subject: chatDoctor[index].subject,
                  messageText: chatDoctor[index].messageText,
                  time: chatDoctor[index].time,
                  status: chatDoctor[index].status,
                  isMessageRead: chatDoctor[index].isMessageRead,
                  statusColor: chatDoctor[index].statusColor,
                  userRole: widget.userRole,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}