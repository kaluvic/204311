import 'package:cs311hw06/pokemon_counter.dart';
import 'package:cs311hw06/pokemon_list.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            PokemonCounter(),
            PokemonList(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: pokemonService.themeColor,
          selectedItemColor: pokemonService.themeColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.catching_pokemon), label: 'Pokemon'),
          ],
        ),
      );
    });
  }
}
