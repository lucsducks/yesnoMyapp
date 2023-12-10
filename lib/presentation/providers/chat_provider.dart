import 'package:flutter/material.dart';
import 'package:yesnomyapp/config/helpers/get_yes_no.dart';
import 'package:yesnomyapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYesNo = GetYesNo();
  final chatScrollController = ScrollController();
  List<Message> message = [
    Message(text: "Hola", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    message.add(newMessage);
    if (text.endsWith('?')) {
      herReplu();
    }
    notifyListeners();
    moveScrollToBotom();
  }

  Future<void> herReplu() async {
    final herMessage = await getYesNo.getAnswer();
    message.add(herMessage);
    notifyListeners();
    moveScrollToBotom();
  }

  Future<void> moveScrollToBotom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      chatScrollController.position.maxScrollExtent, // se pocisiona al final
    );
  }
}
