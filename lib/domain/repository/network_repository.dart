import 'package:anime/domain/model/anime.dart';

abstract class NetworkRepository{
  Future<List<Anime>> getAnimeList();
}