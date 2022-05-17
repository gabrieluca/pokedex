import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../controller/list_controller.dart';
import '../utils/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final ListController controller;

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
      ),
    );
  }
}
