import 'package:dartz/dartz.dart';

import '../../domain/entitites/pokemon_detail.dart';
import '../../domain/entitites/pokemon_list.dart';
import '../../domain/entitites/species.dart';
import '../../domain/errors/failure.dart';
import '../../domain/repositories/pokedex_repository.dart';
import '../datasources/datasource.dart';

class PokedexRepositoryImpl extends PokedexRepository {
  PokedexRepositoryImpl(this._datasource);

  final Datasource _datasource;

  @override
  Future<Either<Failure, PokemonListEntity>> getPokemonList({
    int? offset,
    int? limit,
  }) async {
    final failureOrResponse = await _datasource.get(
      'pokemon',
      queryParameters: {
        'offset': offset,
        'limit': limit,
      },
    );
    return failureOrResponse.fold(
      (error) => Left(error),
      (response) => Right(PokemonListEntity.fromMap(response)),
    );
  }

  @override
  Future<Either<Failure, PokemonDetailEntity>> getPokemonDetail(
    String url,
  ) async {
    final failureOrResponse = await _datasource.get(url);
    return failureOrResponse.fold(
      (error) => Left(error),
      (response) => Right(PokemonDetailEntity.fromMap(response)),
    );
  }

  @override
  Future<Either<Failure, Description>> getPokemonDescription(
    int pokemonId,
  ) async {
    final failureOrResponse = await _datasource.get('pokemon-species/$pokemonId');
    return failureOrResponse.fold(
      (error) => Left(error),
      (response) => Right(
        SpeciesEntity.fromMap(response).flavorTextEntries?[7].flavorText ?? '',
      ),
    );
  }
}
