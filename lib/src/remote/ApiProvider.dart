import 'package:flutter_pokedex/src/remote/ApiBaseHelper.dart';
import 'package:flutter_pokedex/src/remote/model/PokemonResponse.dart';

class ApiProvider {

  ApiBaseHelper _helper = ApiBaseHelper();


  Future<List<Results>> fetchPokemons({int offset = 0}) async {
    final path = 'pokemon/?offset=$offset&limit=20';
    final responseString = await _helper.get(path);
    final response = PokemonResponse.fromJson(responseString).results;

    return response;
  }

}