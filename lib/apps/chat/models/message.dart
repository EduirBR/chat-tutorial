import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderID;
  final String senderEmail;
  final String receiverID;

  final String message;
  final Timestamp timestamp;

  MessageModel(
      {required this.senderID,
      required this.senderEmail,
      required this.receiverID,
      required this.message,
      required this.timestamp});

  MessageModel fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderID: json['senderID'],
      senderEmail: json['senderEmail'],
      receiverID: json['receiverID'],
      message: json['message'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
