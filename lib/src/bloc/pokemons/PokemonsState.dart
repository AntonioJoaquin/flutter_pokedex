import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/src/remote/model/PokemonResponse.dart';

abstract class PokemonsState extends Equatable {
  const PokemonsState();
}

class WithoutPokemonsState extends PokemonsState {
  final List<Results> pokemons = [];

  @override
  List<Object> get props => [pokemons];
}

class WithPokemonsState extends PokemonsState {
  final List<Results> pokemons;
  final int amount;

  WithPokemonsState({@required this.pokemons, @required this.amount});

  @override
  List<Object> get props => [this.pokemons, this.amount];
}
