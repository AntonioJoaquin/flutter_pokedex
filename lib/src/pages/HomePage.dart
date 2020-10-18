import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokedex/src/bloc/pokemons/PokemonsBloc.dart';
import 'package:flutter_pokedex/src/bloc/pokemons/PokemonsEvent.dart';
import 'package:flutter_pokedex/src/bloc/pokemons/PokemonsState.dart';
import 'package:flutter_pokedex/src/remote/model/PokemonResponse.dart';

class HomePage extends StatelessWidget {

  PokemonsBloc pokemonsBloc;
  bool scrollSwitch = true;


  @override
  Widget build(BuildContext context) {
    pokemonsBloc = BlocProvider.of<PokemonsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Poke App'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
        bloc: pokemonsBloc,
        builder: (context, state) {
          if (state is WithoutPokemonsState) {
            pokemonsBloc.add(AddMorePokemons());

            return Center(child: CircularProgressIndicator());
          } else if (state is WithPokemonsState) {
            scrollSwitch = true;

            return _list(state);
          }

          return Container();
        });
  }

  Widget _list(WithPokemonsState state) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          scrollSwitch == true) {
        scrollSwitch = false;
        pokemonsBloc.add(AddMorePokemons());
      }
    });

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        childAspectRatio: .7,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0),
      controller: scrollController,
      itemCount: state.pokemons.length,
      itemBuilder: (BuildContext context, int index) {
        return _listTile(context, state.pokemons[index]);
      },
    );
  }

  Widget _listTile(BuildContext context, Results pokemon) {
    final chunks = pokemon.url.split('/');
    var id = chunks[6];

    return GridTile(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image(
            image: NetworkImage(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${id}.png'
            )
        ),
      ),
      footer: GridTileBar(
        backgroundColor:Theme.of(context).primaryColor,
        title: Text(pokemon.name),
      ),
    );
  }
}
