import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  DateTime dataHora = DateTime.now();
  String texto ="";
  String userId = "";
  String nickName = "";

  ChatModel({required this.texto, required this.userId, required this.nickName});

  ChatModel.fromJson(Map<String, dynamic> json) {
    dataHora = (json['dataHora'] as Timestamp).toDate();
    texto = json['texto'];
    userId = json['userId'];
    nickName = json['nickName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataHora'] = Timestamp.fromDate(dataHora) ;
    data['texto'] = texto;
    data['userId'] = userId;
    data['nickName'] = nickName;
    return data;
  }
}