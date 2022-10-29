import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/custom_header.dart';
import '../../utils/constants.dart';
import '../../utils/ui_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _Background(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const _HomeHeader(),
                  Column(
                    children: const [
                      SizedBox(height: 52),
                      _HomeTitle(),
                      SizedBox(height: 49),
                      _HomeDescription(),
                      SizedBox(height: 42),
                      _SearchButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: UIHelper.convertRadiusToSigma(10),
          sigmaY: UIHelper.convertRadiusToSigma(10),
        ),
        child: Container(
          color: ColorConstants.backgroundHomeColor,
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
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
                'assets/icons/menu.svg',
                semanticsLabel: 'Menu',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeTitle extends StatelessWidget {
  const _HomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 39,
          child: Center(
            child: Text(
              TextConstants.homeTitle,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeDescription extends StatelessWidget {
  const _HomeDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208,
      child: Row(
        children: [
          Expanded(
            child: Text(
              TextConstants.homeDescription,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchButton extends StatelessWidget {
  const _SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.searchButtonColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: ColorConstants.searchButtonShadowColor,
            offset: Offset(1, 0),
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                TextConstants.searchButtonName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
