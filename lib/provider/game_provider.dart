import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider extends ChangeNotifier {
  int _totalCoins = 0;
  int get totalCoins => _totalCoins;

  Future<void> saveProgress(int coins) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("totalCoins", coins);
    _totalCoins = coins;
    notifyListeners();
  }

  void addCoins(int coins) {
    _totalCoins += coins;
    notifyListeners();
  }

  Future<void> setCoinsOnCategory(String categoryId, int coins) async {
    final prefs = await SharedPreferences.getInstance();
    int? currentCoins = prefs.getInt(categoryId) ?? 0;
    if (coins > currentCoins) {
      prefs.setInt(categoryId, coins);
    }
  }

  Future<int> getCoinsOnCategory(String categoryId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(categoryId) ?? 0;
  }

  Future<void> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    _totalCoins = prefs.getInt("totalCoins") ?? 0;
    notifyListeners();
  }
}
