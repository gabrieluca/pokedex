import 'package:dartz/dartz.dart';

import '../entitites/pokemon_detail.dart';
import '../entitites/pokemon_list.dart';
import '../errors/failure.dart';

abstract class PokedexRepository {
  Future<Either<Failure, PokemonListEntity>> getPokemonList({
    int offset,
    int limit,
  });

  Future<Either<Failure, PokemonDetailEntity>> getPokemonDetail(String url);

  Future<Either<Failure, Description>> getPokemonDescription(int pokemonId);
}
