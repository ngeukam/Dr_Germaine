import 'package:flutter/cupertino.dart';

class ChatDoctor{
  String subject;
  String messageText;
  String time;
  String status;
  bool isMessageRead;
  Color statusColor;
  ChatDoctor({required this.subject,required this.messageText,required this.time, required this.status, required this.isMessageRead, required this.statusColor,});
}