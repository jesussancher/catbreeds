import 'package:catbreeds/core/network/http_client.dart';
import 'package:catbreeds/core/router/routes.dart';
import 'package:catbreeds/ui/pages/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final client = HttpClient();
    // client.get(url: 'https://api.thecatapi.com/v1/breeds');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'CatBreeds',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFC49A6C)),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: routes,
    );
  }
}
