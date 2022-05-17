import 'package:flutter/material.dart';

import '../../components/pokeatlas_header.dart';
import '../../components/menu_tile.dart';
import '../../utils/constants.dart';
import '../list/list_page.dart';
import 'home_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: ColorConstants.backgroundMenuColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    PokeAtlasHeader(
                      isMenuIcon: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _MenuBody(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuBody extends StatelessWidget {
  const _MenuBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 44),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: MenuTile(
            iconPath: 'assets/icons/home.svg',
            title: TextConstants.homeMenuTitle,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Container(
            height: 1,
            width: 160,
            color: ColorConstants.dividerMenuColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: MenuTile(
            iconPath: 'assets/icons/list.svg',
            title: TextConstants.listMenuTitle,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
