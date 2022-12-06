import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../controller/list_controller.dart';
import '../utils/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar(
    this.controller, {
    super.key,
  });
  final ListController controller;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Timer? _debounce;

  void _onSearchChanged(String search) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () {
        widget.controller.searchPokemon(search.toLowerCase());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConstants.pokemonCardShadow,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      height: 30,
      child: TextField(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey,
            ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.homeBackground,
            ),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstants.homeBackground,
            ),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          contentPadding: const EdgeInsets.only(left: 16),
          hintText: TextConstants.listSearch,
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w200,
                color: ColorConstants.listBarText,
              ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              IconPathConstants.search,
              semanticsLabel: TextConstants.listSearch,
            ),
          ),
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }
}
