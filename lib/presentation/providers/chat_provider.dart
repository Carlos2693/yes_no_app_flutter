import 'package:flutter/material.dart';

import 'package:yes_no_app/config/theme/helpers/get_yes_not_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNotAnswer getYesNotAnswer = GetYesNotAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor', fromWho: FromWho.mine),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.mine),
  ];

  Future<void> herReply() async {
    final herMessage = await getYesNotAnswer.getAnwer();
    messageList.add(herMessage);
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    
    final newMessage = Message(fromWho: FromWho.mine, text: text);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future <void> moveScrollToBottom() async {
    // dont work
    Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
