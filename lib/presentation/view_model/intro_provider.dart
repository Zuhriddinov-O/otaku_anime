import 'package:flutter/cupertino.dart';

import '../../data/repository/local_repository_impl.dart';

class IntroProvider extends ChangeNotifier {
  static final _repo = LocalRepositoryImpl();

  Future<bool> get state => _repo.isFirstTime(); // 1

  bool introState = false;
  
  void getState() async {
    introState = await _repo.isFirstTime(); // 2
    notifyListeners();
  }

  void _sevaState(bool state) async {
    await _repo.saveIntro(state);
  }
}