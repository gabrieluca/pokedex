import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entitites/pokemon_detail.dart';
import '../../domain/entitites/pokemon_list.dart';
import '../../domain/repositories/pokedex_repository.dart';

class ListController extends GetxController with StateMixin<List<PokemonDetailEntity>> {
  final PokedexRepository _pokedexRepository;

  ListController(this._pokedexRepository);

  final listEntity = Rxn<PokemonListEntity>();
  final pokemonDetailList = RxList<PokemonDetailEntity>();
  final pageList = RxList<PokemonDetailEntity>();
  final typeSelectedMap = {
    for (var i in PokemonType.values) i: false,
  }.obs;
  final scrollController = ScrollController();
  final currentOffset = Rx<int>(0);
  final listEndStatus = Rx<RxStatus>(RxStatus.empty());

  List<PokemonType> get selectedTypes => [
        for (var i in typeSelectedMap.keys)
          if (typeSelectedMap[i]!) i
      ];

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
    initPage();
    initScrollListener();
    initFilterListener();
  }

  void addPokemonsToList(List<PokemonDetailEntity> newList) {
    pokemonDetailList.addAll(newList);
    pageList.addAll(pokemonDetailList);
  }

  ///The list of 150 pokemons is fetched at first, but without details enough to show the cards.
  ///Then the first 20 are fully loaded with details.
  ///Finally, every time the page is scrolled to the end, the list is updated with the next 20 pokemons.
  void initScrollListener() {
    scrollController.addListener(
      () async {
        if (pokemonDetailList.isNotEmpty) {
          if (scrollController.position.pixels >= scrollController.position.maxScrollExtent &&
              !listEndStatus.value.isLoading) {
            if (pokemonDetailList.length < 150) {
              _getNextPage();
            }
          }
        }
      },
    );
  }

  void initFilterListener() {
    typeSelectedMap.listen((_) => filterList());
  }

  Future<void> initPage() async {
    await getPokemonList(limit: 150);
    await getPokemonDetails();
    if (pageList.isNotEmpty) {
      change(pageList, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.empty());
    }
  }

  Future<void> getPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    final failureOrResponse = await _pokedexRepository.getPokemonList(
      offset: offset,
      limit: limit,
    );
    failureOrResponse.fold(
      (error) => change(null, status: RxStatus.error()),
      (listResponse) {
        listEntity.value = listResponse;
      },
    );
  }

  void _getNextPage() {
    listEndStatus.value = RxStatus.loading();
    getPokemonDetails();
  }

  Future<void> getPokemonDetails() async {
    const count = 20;
    var newList = <PokemonDetailEntity>[];
    for (var pokemonItem in listEntity.value!.pokemonList.skip(currentOffset.value).take(count)) {
      if (pokemonItem.url != null) {
        final failureOrResponse = await _pokedexRepository.getPokemonDetail(pokemonItem.url!);
        failureOrResponse.fold(
          (error) => null,
          (detailResponse) {
            newList.add(detailResponse);
          },
        );
      }
    }
    addPokemonsToList(newList);
    change(pageList, status: RxStatus.success());
    currentOffset.value += 20;
    if (pokemonDetailList.length < 150) {
      listEndStatus.value = RxStatus.empty();
    } else {
      listEndStatus.value = RxStatus.success();
    }
  }

  Future<void> getAllPokemonDetails() async {
    if (pokemonDetailList.length < 150) {
      change(pageList, status: RxStatus.loading());
      var newList = <PokemonDetailEntity>[];
      for (var pokemonItem in listEntity.value!.pokemonList.skip(currentOffset.value)) {
        if (pokemonItem.url != null) {
          final failureOrResponse = await _pokedexRepository.getPokemonDetail(pokemonItem.url!);
          failureOrResponse.fold(
            (error) => null,
            (detailResponse) {
              newList.add(detailResponse);
            },
          );
        }
      }
      addPokemonsToList(newList);
      change(pageList, status: RxStatus.success());

      listEndStatus.value = RxStatus.success();
    }
  }

  Future<void> searchPokemon(String searchedText) async {
    await getAllPokemonDetails();
    pageList.assignAll(
      pokemonDetailList
          .where(
            (e) =>
                e.name.contains(searchedText) ||
                e.id.toString().contains(searchedText) ||
                (e.primaryType?.value().contains(searchedText) ?? false) ||
                (e.secondaryType?.value().contains(searchedText) ?? false),
          )
          .toList(),
    );
    change(pageList, status: RxStatus.success());
  }

  void filterList() async {
    await getAllPokemonDetails();
    if (selectedTypes.isEmpty) {
      pageList.assignAll(pokemonDetailList);
      change(pageList, status: RxStatus.success());
    } else {
      pageList.assignAll(
        pokemonDetailList.where(
          (e) {
            return selectedTypes.contains(e.primaryType) || selectedTypes.contains(e.secondaryType);
          },
        ).toList(),
      );
      change(pageList, status: RxStatus.success());
    }
  }

  Future<String?> getPokemonDescription(int pokemonId) async {
    final failureOrResponse = await _pokedexRepository.getPokemonDescription(pokemonId);
    return failureOrResponse.fold(
      (error) => null,
      (descriptionResponse) => descriptionResponse,
    );
  }
}
