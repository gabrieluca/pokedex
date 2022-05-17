import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/home/menu_page.dart';
import '../utils/constants.dart';

class PokeAtlasHeader extends StatelessWidget {
  const PokeAtlasHeader({
    Key? key,
    this.onTap,
    this.isMenuIcon = true,
  }) : super(key: key);

  final bool isMenuIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: Center(
            child: Text(
              TextConstants.appTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const Spacer(),
        isMenuIcon
            ? GestureDetector(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      child: SvgPicture.asset(
                        'assets/icons/menu.svg',
                        semanticsLabel: 'Menu',
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const MenuPage(),
                    ),
                  );
                },
              )
            : GestureDetector(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      child: SvgPicture.asset(
                        'assets/icons/close.svg',
                        semanticsLabel: 'Fechar',
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
      ],
    );
  }
}
