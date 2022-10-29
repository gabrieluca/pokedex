import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          semanticsLabel: 'Página Inicial',
        ),
        const SizedBox(
          width: 29,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}