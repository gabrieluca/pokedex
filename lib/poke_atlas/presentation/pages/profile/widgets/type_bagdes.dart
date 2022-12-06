import 'package:flutter/material.dart';

import '../../../../domain/entitites/pokemon_detail.dart';
import '../../../utils/extensions.dart';
import '../../../utils/mapper.dart';

class TypeBadges extends StatelessWidget {
  const TypeBadges(
    this.pokemon, {
    super.key,
  });

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            if (LayoutMapper.getImageAssetFromPokemonTypeMap[pokemon.primaryType] != null)
              SizedBox(
                height: 46,
                child: Image.asset(
                  LayoutMapper.getImageAssetFromPokemonTypeMap[pokemon.primaryType]!,
                ),
              ),
            const SizedBox(width: 12),
            if (pokemon.primaryType != null)
              Text(
                pokemon.primaryType!.value().capitalize(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
        Row(
          children: [
            if (LayoutMapper.getImageAssetFromPokemonTypeMap[pokemon.secondaryType] != null)
              SizedBox(
                height: 46,
                child: Image.asset(
                  LayoutMapper.getImageAssetFromPokemonTypeMap[pokemon.secondaryType]!,
                ),
              ),
            const SizedBox(width: 12),
            if (pokemon.secondaryType != null)
              Text(
                pokemon.secondaryType!.value().capitalize(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ],
    );
  }
}
