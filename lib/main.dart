import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnomyapp/config/theme/app_theme.dart';
import 'package:yesnomyapp/presentation/providers/chat_provider.dart';
import 'package:yesnomyapp/presentation/screens/chat/chat_scren.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes No My App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
