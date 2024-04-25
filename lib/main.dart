import 'package:anime/data/repository/local_repository_impl.dart';
import 'package:anime/presentation/page/home_page.dart';
import 'package:anime/presentation/page/intro_page.dart';
import 'package:anime/presentation/view_model/home_vm.dart';
import 'package:anime/presentation/view_model/intro_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});

  final _repo = LocalRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (v) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (v) => IntroProvider(),
        ),
        ChangeNotifierProvider(
          create: (v) => IntroProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Demo",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.grey,
            brightness: Brightness.dark,
          ),
        ),
        home: FutureBuilder(
          future: _repo.isFirstTime(),
          builder: (context, snapshot) {
            return snapshot.data == true ? const HomePage() : IntroPage();
          },
        ),
      ),
    );
  }
}
