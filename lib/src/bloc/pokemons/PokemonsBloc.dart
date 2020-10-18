import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/src/bloc/pokemons/PokemonsEvent.dart';
import 'package:flutter_pokedex/src/bloc/pokemons/PokemonsState.dart';
import 'package:flutter_pokedex/src/repository/PokemonRepository.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {

  PokemonRepository pokemonRepository;


  PokemonsBloc({@required this.pokemonRepository})
      : assert(pokemonRepository != null);


  @override
  PokemonsState get initialState => WithoutPokemonsState();

  @override
  Stream<PokemonsState> mapEventToState(PokemonsEvent event) async* {
    if (event is AddMorePokemons) {
      try {
        final pokemons = await this.pokemonRepository.fetchPokemons();

        yield (WithPokemonsState(pokemons: pokemons, amount: pokemons.length));
      } catch (error) {
        print(error);
      }
    }
  }
  
}
