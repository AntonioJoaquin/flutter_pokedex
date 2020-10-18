import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/app.dart';
import 'package:flutter_pokedex/src/bloc/pokemons/PokemonsBloc.dart';
import 'package:flutter_pokedex/src/repository/PokemonRepository.dart';

void main() {
  PokemonRepository pokemonRepository = PokemonRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<PokemonsBloc>(
        create: (BuildContext context) => PokemonsBloc(pokemonRepository: pokemonRepository)
      )
    ], 
    child: MyApp()
  ));
}