import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_sample/home/home.dart';
import 'package:mvvm_sample/theme/theme_constants.dart';
import 'package:mvvm_sample/theme/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddOne(),
        ),
        ChangeNotifierProvider(
          create: (context) => Addtwo(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    themeManager.removeListener(themeListner);
    super.dispose();
  }

  @override
  void initState() {
    print('material');
    themeManager.addListener(themeListner);
    super.initState();
  }

  themeListner() {
    if (mounted) {
      setState(() {
        print('changed');
        log('d');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: HomeScreen(),
    );
  }
}
