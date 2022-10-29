import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entitites/pokemon_detail.dart';
import '../../domain/entitites/pokemon_stats.dart';
import '../components/pokeatlas_header.dart';
import '../utils/constants.dart';
import '../utils/extensions.dart';
import '../utils/mapper.dart';

const _statsList = ['HP', 'ATK', 'DEF', 'SpP', 'SpD', 'spd'];

///List obtained through iterating over the 150 first pokemons and getting the maximum one for each stat.
const _statsMax = [250, 134, 180, 154, 125, 150];

class ProfilePage extends StatelessWidget {
  const ProfilePage(this.pokemon, this.description, {Key? key})
      : super(key: key);

  final PokemonDetailEntity pokemon;
  final Description? description;

  @override
  Widget build(BuildContext context) {
    final _typeColor = LayoutMapper.getColorFromPokemonTypeMap[
        pokemon.primaryType ?? pokemon.secondaryType];
    return Scaffold(
      body: Stack(
        children: [
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
                _PokemonAvatar(pokemon, _typeColor),
                Container(
                  color: ColorConstants.menuBackground,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const _DescriptionTitle(),
                      _PokemonTypeDivider(pokemon),
                      const SizedBox(height: 10),
                      _DescriptionBody(description),
                      const SizedBox(height: 20),
                      _TypeBadges(pokemon),
                      const SizedBox(height: 24),
                      const _StatsTitle(),
                      _PokemonTypeDivider(pokemon),
                      const SizedBox(height: 24),
                      ...List.generate(
                        6,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 8.0,
                          ),
                          child: _StatsBar(index, _typeColor, pokemon.stats),
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

class _PokemonAvatar extends StatelessWidget {
  const _PokemonAvatar(
    this.pokemon,
    this.typeColor, {
    Key? key,
  }) : super(key: key);

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

class _DescriptionTitle extends StatelessWidget {
  const _DescriptionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Text(
          TextConstants.profileDescriptionTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _DescriptionBody extends StatelessWidget {
  const _DescriptionBody(
    this.description, {
    Key? key,
  }) : super(key: key);

  final Description? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            description ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _TypeBadges extends StatelessWidget {
  const _TypeBadges(
    this.pokemon, {
    Key? key,
  }) : super(key: key);

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            if (LayoutMapper
                    .getImageAssetFromPokemonTypeMap[pokemon.primaryType] !=
                null)
              SizedBox(
                height: 46,
                child: Image.asset(
                  LayoutMapper
                      .getImageAssetFromPokemonTypeMap[pokemon.primaryType]!,
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
            if (LayoutMapper
                    .getImageAssetFromPokemonTypeMap[pokemon.secondaryType] !=
                null)
              SizedBox(
                height: 46,
                child: Image.asset(
                  LayoutMapper
                      .getImageAssetFromPokemonTypeMap[pokemon.secondaryType]!,
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

class _StatsTitle extends StatelessWidget {
  const _StatsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Text(
          TextConstants.profileStatsTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _StatsBar extends StatelessWidget {
  const _StatsBar(
    this.index,
    this.typeColor,
    this.stats, {
    Key? key,
  }) : super(key: key);

  final int index;
  final Color? typeColor;
  final PokemonStatsEntity stats;
  @override
  Widget build(BuildContext context) {
    int statNumber;
    switch (index) {
      case 0:
        statNumber = stats.hp.baseStat;
        break;
      case 1:
        statNumber = stats.attack.baseStat;
        break;
      case 2:
        statNumber = stats.defense.baseStat;
        break;
      case 3:
        statNumber = stats.specialAttack.baseStat;
        break;
      case 4:
        statNumber = stats.specialDefense.baseStat;
        break;
      case 5:
        statNumber = stats.speed.baseStat;
        break;
      default:
        statNumber = 0;
    }
    final statItemMax = _statsMax[index];
    final statFullWidth = MediaQuery.of(context).size.width * 3 / 5;
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            _statsList[index],
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: 20),
        Stack(
          children: [
            Container(
              height: 20,
              width: statFullWidth,
              decoration: BoxDecoration(
                color: ColorConstants.statBarBackground,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 20,
              width: statFullWidth *
                  (statNumber < statItemMax ? statNumber : statItemMax) /
                  statItemMax,
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PokemonTypeDivider extends StatelessWidget {
  const _PokemonTypeDivider(
    this.pokemon, {
    Key? key,
  }) : super(key: key);

  final PokemonDetailEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2,
            color: LayoutMapper.getColorFromPokemonTypeMap[
                pokemon.primaryType ?? pokemon.secondaryType],
          ),
        ),
      ],
    );
  }
}
