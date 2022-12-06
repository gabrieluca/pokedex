import 'package:flutter/material.dart';

import '../../../../domain/entitites/pokemon_detail.dart';
import '../../../utils/mapper.dart';

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
