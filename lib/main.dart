import 'package:flutter/material.dart';
import 'package:sliver/dio/dio.dart';
import 'package:sliver/sourece_api/source_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Services.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SourceNeutrantScreen());
  }
}
