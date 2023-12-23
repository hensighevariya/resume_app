import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:resume_app/provider/add_resume_provider.dart';
import 'package:resume_app/provider/home_provider.dart';
import 'package:resume_app/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
    ChangeNotifierProvider<AddResumeProvider>(
        create: (context) => AddResumeProvider()),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Resume App',
        home: const HomeScreen(),
      ),
    );
  }
}
