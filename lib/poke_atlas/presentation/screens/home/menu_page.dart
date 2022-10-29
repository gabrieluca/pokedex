import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_header.dart';
import '../../components/menu_tile.dart';
import '../../utils/constants.dart';

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
                  children: const [
                    _MenuHeader(),
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

class _MenuHeader extends StatelessWidget {
  const _MenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      child: GestureDetector(
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: MenuTile(
            iconPath: 'assets/icons/home.svg',
            title: TextConstants.homeMenuTitle,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: MenuTile(
            iconPath: 'assets/icons/list.svg',
            title: TextConstants.listMenuTitle,
          ),
        ),
      ],
    );
  }
}
