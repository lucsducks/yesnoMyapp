import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnomyapp/domain/entities/message.dart';
import 'package:yesnomyapp/presentation/providers/chat_provider.dart';
import 'package:yesnomyapp/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yesnomyapp/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yesnomyapp/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.freepik.com/vector-premium/dibujos-animados-perfil-mujer_18591-58480.jpg?w=2000'),
          ),
        ),
        title: const Text('Fioooo 🤩'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.message.length,
              itemBuilder: (context, index) {
                final messageU = chatProvider.message[index];
                return (messageU.fromWho == FromWho.her)
                    ? HerMessageBubble(
                        message: messageU,
                      )
                    : MyMessageBubble(
                        message: messageU,
                      );
              },
            )),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
