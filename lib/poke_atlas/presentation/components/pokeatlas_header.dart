import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/home/menu_page.dart';
import '../utils/constants.dart';

class PokeAtlasHeader extends StatelessWidget {
  const PokeAtlasHeader({
    Key? key,
    this.isMenuIcon = true,
  }) : super(key: key);

  final bool isMenuIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              TextConstants.appTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          isMenuIcon
              ? GestureDetector(
                  key: const Key(KeyConstants.headerMenuButton),
                  onTap: () {
                    //TODO Implement AutoRoute or Navigator 2.0
                    //TODO Fix transition
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuPage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          IconPathConstants.menu,
                          semanticsLabel: TextConstants.headerMenuButton,
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  key: const Key(KeyConstants.headerCloseButton),
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: SvgPicture.asset(
                            IconPathConstants.close,
                            semanticsLabel: TextConstants.headerCloseButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
        ],
      ),
    );
  }
}
