import 'package:flutter/material.dart';
import 'package:mvvm_sample/main.dart';
import 'package:mvvm_sample/theme/theme_constants.dart';
import 'package:mvvm_sample/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class AddOne extends ChangeNotifier {
  List<int> a = [];
  void addd() {
    a.add(2);
    notifyListeners();
    print(a);
  }
}

class Addtwo extends ChangeNotifier {
  int c = 0;
  void modifyAddTwo() {
    c = 10;
    notifyListeners();
    print(c);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: themeManager.themeMode == ThemeMode.dark,
              onChanged: (ischanges) {
                themeManager.toggleTheme(ischanges);
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<AddOne>(
              builder: (context, adder, child) => Text(
                adder.a.toString(),
              ),
            ),
            Consumer<Addtwo>(
              builder: (context, modifyTwo, child) =>
                  Text(modifyTwo.c.toString()),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AddOne>().addd();
              },
              child: Text('Click'),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<Addtwo>().modifyAddTwo();
                },
                child: Text('2click'))
          ],
        ),
      ),
    );
  }
}
