import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../domain/entitites/pokemon_detail.dart';
import '../controller/list_controller.dart';
import '../utils/constants.dart';
import '../utils/mapper.dart';

class FilterBar extends StatefulWidget {
  const FilterBar(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final ListController controller;

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(isCollapsed ? 100 : 25)),
              boxShadow: const [
                BoxShadow(
                  color: ColorConstants.pokemonCardShadow,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: _ShowAllButton(isCollapsed: isCollapsed),
                ),
                if (!isCollapsed)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _ChipsGrid(widget.controller),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _ChipsGrid extends StatelessWidget {
  const _ChipsGrid(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by Pokémon types',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: ColorConstants.listBarText,
              ),
        ),
        const SizedBox(height: 8.0),
        Obx(
          () => Wrap(
            children: List.generate(
              controller.typeSelectedMap.entries.length,
              (index) {
                final type = controller.typeSelectedMap.keys.elementAt(index);
                final isSelected =
                    controller.typeSelectedMap.values.elementAt(index);
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _PokemonTypeChip(
                      type,
                      isSelected,
                      onTap: () {
                        controller.typeSelectedMap[type] = !isSelected;
                      },
                    ),
                    const SizedBox(width: 4.0),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ShowAllButton extends StatelessWidget {
  const _ShowAllButton({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 8.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 4.26),
                Text(
                  isCollapsed
                      ? TextConstants.listShowAll
                      : TextConstants.listShowLess,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w200,
                        color: ColorConstants.listBarText,
                      ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(
                    IconPathConstants.downArrow,
                    semanticsLabel: TextConstants.listShowAll,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PokemonTypeChip extends StatelessWidget {
  const _PokemonTypeChip(
    this.type,
    this.isSelected, {
    this.onTap,
    Key? key,
  }) : super(key: key);

  final PokemonType type;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final _typeColor = LayoutMapper.getColorFromPokemonTypeMap[type]!;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isSelected ? _typeColor : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            border: Border.all(
              color: _typeColor,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                type.value(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected ? Colors.white : _typeColor,
                    ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 4),
                Icon(
                  Icons.close,
                  size: 12,
                  color: isSelected ? Colors.white : _typeColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
