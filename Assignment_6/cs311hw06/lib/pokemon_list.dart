import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
          backgroundColor: pokemonService.themeColor,
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    border: (pokemonService.currentIndex == index)
                        ? Border.all(width: 4)
                        : Border.all(width: 0, color: Colors.transparent)),
                child: Image.network(genPokemonImageUrl(index + 1)),
              ),
              onTap: () {
                pokemonService.changePokemonTheme(index);
              },
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
