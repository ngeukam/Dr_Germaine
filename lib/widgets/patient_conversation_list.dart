import 'package:dr_germaine_app/screens/chat_detail.dart';
import 'package:flutter/material.dart';

class PatientConversationList extends StatefulWidget{
  String subject;
  String messageText;
  String time;
  String status;
  bool isMessageRead;
  Color statusColor;
  String userRole;
  PatientConversationList({required this.subject,required this.messageText,required this.time,required this.isMessageRead, required this.status,  required this.statusColor, required this.userRole,});
  @override
  _PatientConversationListState createState() => _PatientConversationListState();
}

class _PatientConversationListState extends State<PatientConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailPage(userRole: widget.userRole);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.subject, style: TextStyle(fontSize: 16, fontWeight: widget.isMessageRead?FontWeight.normal:FontWeight.bold),),
                          SizedBox(height: 6,),
                          Text(widget.messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.normal:FontWeight.bold),),
                          Text(
                            widget.status,
                            style: TextStyle(color: widget.statusColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: TextStyle(fontSize: 12,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}