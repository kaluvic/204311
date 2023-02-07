import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:strings/strings.dart';

class PokemonInfo {
  late final String name;
  late final List<String> types;
  late final String ability;

  PokemonInfo({required this.name,required this.types,required this.ability,});
  String typesToString() {
    return types.map((type) => capitalize(type)).join('/');
  }
}

String genPokemonImageUrl(int pokemonId) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/'
      'pokemon/other/official-artwork/$pokemonId.png';
}

Future<PokemonInfo> fetchPokemonInfo(int pokemonId) async {
  try {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonId')
    );
    final rawJson = jsonDecode(response.body);
    return PokemonInfo(
      name: rawJson['name'],
      types: rawJson['types'].map<String>(
              (element) => element['type']['name'].toString()
             ).toList(),
      ability: rawJson['abilities'][0]['ability']['name'],
    );
  } catch (_) {
    return PokemonInfo(name: 'N/A', types: [], ability: 'N/A',);
  }
}

