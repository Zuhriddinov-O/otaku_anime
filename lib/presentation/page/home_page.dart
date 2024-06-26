import '../view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModel _provider;

  @override
  void initState() {
    Provider.of<HomeViewModel>(context,listen: false).fetchAnimeList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<HomeViewModel>(context, listen: false);
    // if (_provider.animeList.isEmpty) {
    //   _provider.fetchAnimeList();
    // }
    return Scaffold(
      appBar: AppBar(title: const Text("Anime")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: _provider.animeList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(_provider.animeList[index].image ?? "", fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}
