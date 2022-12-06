import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../domain/entitites/pokemon_detail.dart';
import '../../../utils/constants.dart';
import '../../../utils/extensions.dart';

class PokemonAvatar extends StatelessWidget {
  const PokemonAvatar(
    this.pokemon,
    this.typeColor, {
    super.key,
  });

  final Color? typeColor;
  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 184,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  IconPathConstants.profileDrawing,
                  fit: BoxFit.fill,
                  color: typeColor,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    IconPathConstants.profileDrawingBorder,
                    fit: BoxFit.fill,
                    color: typeColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (pokemon.largeImageUrl != null)
          //TODO Move null condition to inside the widget
          SizedBox(
            height: 267,
            child: Column(
              children: [
                Expanded(
                  child: SvgPicture.network(
                    pokemon.largeImageUrl!,
                  ),
                ),
                SizedBox(
                  height: 58,
                  child: Center(
                    child: Text(
                      '#${pokemon.id.toString().padLeft(3, '0')} ${pokemon.name.capitalize()}',
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
