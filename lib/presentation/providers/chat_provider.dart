import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/helper/get_yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(text: 'Sí Amor', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    await moveScrollToButtom();
  }

  Future<void> herReply() async {
    final message = await getYesNoAnswer.getAnswer();
    messagesList.add(message);
    notifyListeners();
    await moveScrollToButtom();
  }

  Future<void> moveScrollToButtom() async {
    await Future.delayed(const Duration(microseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
        curve: Curves.easeOut);
  }

}
