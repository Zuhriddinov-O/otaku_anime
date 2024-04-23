import 'package:anime/data/repository/anime_repository.dart';
import 'package:anime/domain/repository/network_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/anime.dart';

class HomeViewModel extends ChangeNotifier {
  final NetworkRepository _repo = AnimeRepositoryImpl();
  final List<Anime> animeList = [];

  void fetchAnimeList() async {
    final list = await _repo.getAnimeList();
    animeList.addAll(list);
    notifyListeners();
  }
}
