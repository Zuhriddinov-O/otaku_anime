import 'package:anime/data/local/cache_manager.dart';
import 'package:anime/domain/repository/local_repository.dart';

class LocalRepositoryImpl extends LocalRepository {
  final _cache = CacheManager();

  @override
  Future<bool> isFirstTime() {
   return _cache.getIntroState();
  }

  @override
  Future<void> saveIntro(bool fristTime) async {
    await _cache.saveIntroState(fristTime);
  }

}