import 'package:get/get.dart';

import '../../domain/entitites/pokemon_detail.dart';
import '../../domain/entitites/pokemon_list.dart';
import '../../domain/entitites/pokemon_simple.dart';
import '../../domain/repositories/pokedex_repository.dart';

class ListController extends GetxController
    with StateMixin<List<PokemonDetailEntity>> {
  final PokedexRepository _pokedexRepository;

  ListController(this._pokedexRepository);

  final listEntity = Rxn<PokemonListEntity>();
  final pageList = RxList<PokemonSimpleEntity>();
  final pokemonDetailList = RxList<PokemonDetailEntity>();
  final typeSelectedMap = {
    for (var i in PokemonType.values) i: false,
  }.obs;

  Future<void> initPage() async {}

  Future<void> getPokemonList() async {}

  Future<void> getPokemonDetail() async {}

  getNextPage() {}

  void searchList() {}

  void filterList() {}

  Future<String?> getPokemonDescription(int pokemonId) async {}
}
