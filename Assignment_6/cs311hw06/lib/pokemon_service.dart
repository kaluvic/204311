import 'package:cs311hw06/pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;
  int currentIndex = 0;
  var themeColor = const Color(0xffA8A77A);

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  void changePokemonTheme(int index) async {
    var pokemonInfo = await fetchPokemonInfo(index + 1);
    var color = {
      'normal': const Color(0xffA8A77A),
      'fire': const Color(0xffEE8130),
      'water': const Color(0xff6390F0),
      'electric': const Color(0xffF7D02C),
      'grass': const Color(0xff7AC74C),
      'ice': const Color(0xff96D9D6),
      'fighting': const Color(0xffC22E28),
      'poison': const Color(0xffA33EA1),
      'ground': const Color(0xffE2BF65),
      'flying': const Color(0xffA98FF3),
      'psychic': const Color(0xffF95587),
      'bug': const Color(0xffA6B91A),
      'rock': const Color(0xffB6A136),
      'ghost': const Color(0xff735797),
      'dragon': const Color(0xff6F35FC),
      'dark': const Color(0xff705746),
      'steel': const Color(0xffB7B7CE),
      'fairy': const Color(0xffD685AD)
    };

    themeColor = color[pokemonInfo.types.first]!;

    currentIndex = index;
    notifyListeners();
  }
}
