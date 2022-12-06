import 'package:flutter/material.dart';

import '../../../../domain/entitites/pokemon_stats.dart';
import '../../../utils/constants.dart';

const statsList = ['HP', 'ATK', 'DEF', 'SpP', 'SpD', 'spd'];

///List obtained through iterating over the 150 first pokemons and getting the maximum one for each stat.
const statsMax = [250, 134, 180, 154, 125, 150];

class StatsBar extends StatelessWidget {
  const StatsBar(
    this.index,
    this.typeColor,
    this.stats, {
    super.key,
  });

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
    final statItemMax = statsMax[index];
    final statFullWidth = MediaQuery.of(context).size.width * 3 / 5;
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            statsList[index],
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
              decoration: const BoxDecoration(
                color: ColorConstants.statBarBackground,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            Container(
              height: 20,
              width: statFullWidth *
                  (statNumber < statItemMax ? statNumber : statItemMax) /
                  statItemMax,
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
