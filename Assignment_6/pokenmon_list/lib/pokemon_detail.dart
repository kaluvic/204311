import 'package:flutter/material.dart';
import 'package:pokenmon_list/pokemon_api.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({super.key, required this.pokemonId});

  final int pokemonId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPokemonInfo(pokemonId),
        builder: (context, AsyncSnapshot<PokemonInfo> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(title: Text(snapshot.data!.name)),
              body: Column(children: [
                Image.network(genPokemonImageUrl(pokemonId)),
                Text(
                  "Name : ${snapshot.data!.name}",
                ),
                Text(
                  "Type : ${snapshot.data!.typesToString()}",
                ),
                Text(
                  "Abi : ${snapshot.data!.ability}",
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back))
              ]),
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: const Text('')),
              body: const CircularProgressIndicator(),
            );
          }
        });
  }
}
