import 'package:catbreeds/core/di/di.dart';
import 'package:catbreeds/core/router/routes.dart';
import 'package:catbreeds/presentation/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => getIt.get<HomeViewModel>()),
  ], child: const MyApp()));
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
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
