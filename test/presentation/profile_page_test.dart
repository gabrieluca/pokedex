// ignore_for_file: prefer_const_constructors

import 'package:cate_mobile_flutter/main.dart';
import 'package:cate_mobile_flutter/poke_atlas/domain/entitites/pokemon_detail.dart';
import 'package:cate_mobile_flutter/poke_atlas/domain/entitites/pokemon_stats.dart';
import 'package:cate_mobile_flutter/poke_atlas/domain/entitites/pokemon_stats_item.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/components/pokeatlas_header.dart';
import 'package:cate_mobile_flutter/poke_atlas/presentation/pages/profile_page.dart';
import 'package:flutter_test/flutter_test.dart';

const _descriptionInput = 'This is a description.';
const _pokemonDetailInput = PokemonDetailEntity(
  id: 1,
  name: 'Charizard',
  primaryType: PokemonType.fire,
  secondaryType: PokemonType.flying,
  // largeImageUrl:
  //     'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/6.svg',
  stats: PokemonStatsEntity(
    hp: PokemonStatsItemEntity(name: 'HP', baseStat: 50, effort: 0),
    specialAttack: PokemonStatsItemEntity(name: 'HP', baseStat: 50, effort: 0),
    specialDefense: PokemonStatsItemEntity(name: 'HP', baseStat: 50, effort: 0),
    attack: PokemonStatsItemEntity(name: 'HP', baseStat: 50, effort: 0),
    defense: PokemonStatsItemEntity(name: 'HP', baseStat: 50, effort: 0),
    speed: PokemonStatsItemEntity(name: 'HP', baseStat: 50, effort: 0),
  ),
);

void main() {
  testWidgets('Profile Page', (tester) async {
    await tester.pumpWidget(
      PokeAtlasApp(
        child: ProfilePage(
          _pokemonDetailInput,
          _descriptionInput,
        ),
      ),
    );
    await shouldOpenDescriptionPage(tester);
  });
}

Future<void> shouldOpenDescriptionPage(WidgetTester tester) async {
  await tester.pumpAndSettle();

  expect(find.byType(PokeAtlasHeader), findsOneWidget);

  // expect(
  //   find.text(
  //     '#${_pokemonDetailInput.id.toString().padLeft(3, '0')} ${_pokemonDetailInput.name.capitalize()}',
  //   ),
  //   findsOneWidget,
  // );

  expect(find.text(_descriptionInput), findsOneWidget);

  // expect(find.text(TextConstants.profileDescriptionTitle), findsOneWidget);
  // expect(find.text(TextConstants.profileStatsTitle), findsOneWidget);
}
