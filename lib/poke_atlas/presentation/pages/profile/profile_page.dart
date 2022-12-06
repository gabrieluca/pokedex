import 'package:flutter/material.dart';

import '../../../domain/entitites/pokemon_detail.dart';
import '../../components/pokeatlas_header.dart';
import '../../utils/constants.dart';
import '../../utils/mapper.dart';
import 'widgets/pokemon_avatar.dart';
import 'widgets/profile_description_body.dart';
import 'widgets/profile_description_title.dart';
import 'widgets/stats_bar.dart';
import 'widgets/stats_title.dart';
import 'widgets/type_bagdes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage(this.pokemon, this.description, {super.key});

  final PokemonDetailEntity pokemon;
  final Description? description;

  @override
  Widget build(BuildContext context) {
    final _typeColor =
        LayoutMapper.getColorFromPokemonTypeMap[pokemon.primaryType ?? pokemon.secondaryType];
    return Scaffold(
      body: Stack(
        children: [
          //TODO Add back button
          //TODO Add Sliver app bar header with pokemon icon
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePathConstants.listBackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: PokeAtlasHeader(),
                  ),
                ),
                PokemonAvatar(pokemon, _typeColor),
                Container(
                  color: ColorConstants.menuBackground,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const ProfileDescriptionTitle(),
                      PokemonTypeDivider(pokemon),
                      const SizedBox(height: 10),
                      ProfileDescriptionBody(description),
                      const SizedBox(height: 20),
                      TypeBadges(pokemon),
                      const SizedBox(height: 24),
                      const StatsTitle(),
                      PokemonTypeDivider(pokemon),
                      const SizedBox(height: 24),
                      ...List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 8.0,
                          ),
                          child: StatsBar(index, _typeColor, pokemon.stats),
                        ),
                      ),
                      const SizedBox(height: 19),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonTypeDivider extends StatelessWidget {
  const PokemonTypeDivider(
    this.pokemon, {
    super.key,
  });

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            color: LayoutMapper
                .getColorFromPokemonTypeMap[pokemon.primaryType ?? pokemon.secondaryType],
          ),
        ),
      ],
    );
  }
}
