import 'package:flutter/material.dart';
import 'package:notes_app/config.dart';
import 'package:notes_app/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ConfigModel())],
      child: MaterialApp(
        title: 'Drrew Notes App',
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
