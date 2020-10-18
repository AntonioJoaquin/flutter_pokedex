import 'package:flutter_pokedex/src/remote/ApiProvider.dart';
import 'package:flutter_pokedex/src/remote/model/PokemonResponse.dart';

class PokemonRepository {
  ApiProvider _apiProvider = ApiProvider();
  List<Results> _pokemons = [];
  int _count = 0;

  Future<List<Results>> fetchPokemons() async {
    if (this._pokemons.isEmpty) {
      this._pokemons.addAll(await _apiProvider.fetchPokemons());
    } else {
      this
          ._pokemons
          .addAll(await _apiProvider.fetchPokemons(offset: this._count));
    }
    this._count = this._pokemons.length;

    return _pokemons;
  }
}
