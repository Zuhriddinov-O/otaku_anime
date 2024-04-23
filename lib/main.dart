import 'package:anime/presentation/page/home_page.dart';
import 'package:anime/presentation/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (v) => HomeViewModel(),
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.grey,
            brightness: Brightness.dark,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
