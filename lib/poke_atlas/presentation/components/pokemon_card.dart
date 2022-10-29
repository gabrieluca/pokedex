import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entitites/pokemon_detail.dart';
import '../utils/constants.dart';
import '../utils/mapper.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(this.pokemon, {Key? key, this.onTap}) : super(key: key);

  final PokemonDetailEntity pokemon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final _color = LayoutMapper.getColorFromPokemonTypeMap[
            pokemon.primaryType ?? pokemon.secondaryType] ??
        Colors.grey;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorConstants.pokemonCardShadow,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Column(
                children: [
                  _IdTile(color: _color, pokemon: pokemon),
                  InfoTile(pokemon: pokemon, color: _color),
                  _BottomPadding(color: _color)
                ],
              ),
              if (pokemon.imageUrl != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 100,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.imageUrl!,
                        fadeInDuration: const Duration(milliseconds: 100),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IdTile extends StatelessWidget {
  const _IdTile({
    Key? key,
    required Color? color,
    required this.pokemon,
  })  : _color = color,
        super(key: key);

  final Color? _color;
  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 25,
            color: _color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 9),
                    Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 3),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    Key? key,
    required this.pokemon,
    required Color? color,
  })  : _color = color,
        super(key: key);

  final PokemonDetailEntity pokemon;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 65,
            color: Colors.white,
            child: Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  pokemon.name.toLowerCase(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: _color,
                      ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (LayoutMapper.getImageAssetFromPokemonTypeMap[
                            pokemon.primaryType] !=
                        null)
                      SizedBox(
                        width: 18,
                        height: 17.22,
                        child: Image.asset(
                          LayoutMapper.getImageAssetFromPokemonTypeMap[
                              pokemon.primaryType]!,
                        ),
                      ),
                    if (pokemon.primaryType != null &&
                        pokemon.secondaryType != null)
                      const SizedBox(
                        height: 9.78,
                      ),
                    if (LayoutMapper.getImageAssetFromPokemonTypeMap[
                            pokemon.secondaryType] !=
                        null)
                      SizedBox(
                        width: 18,
                        height: 17.22,
                        child: Image.asset(
                          LayoutMapper.getImageAssetFromPokemonTypeMap[
                              pokemon.secondaryType]!,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 111),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomPadding extends StatelessWidget {
  const _BottomPadding({
    Key? key,
    required Color? color,
  })  : _color = color,
        super(key: key);

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 10,
            color: _color,
          ),
        ),
      ],
    );
  }
}
