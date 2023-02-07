import 'package:flutter/material.dart';
import 'package:pokenmon_list/pokemon_api.dart';
import 'package:pokenmon_list/pokemon_detail.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon List')),
      body: Row(
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PokemonDetail(pokemonId: 1)));
                  },
                  child: Image.network(genPokemonImageUrl(1)))),
          Expanded(child: Image.network(genPokemonImageUrl(4))),
          Expanded(child: Image.network(genPokemonImageUrl(7))),
        ],
      ),
    );
  }
}
