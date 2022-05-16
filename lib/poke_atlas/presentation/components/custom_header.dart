import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomHeader extends StatelessWidget {
  final Widget? child;
  const CustomHeader({
    Key? key,
    this.child,
  }) : super(key: key);

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
        child ?? const SizedBox(),
      ],
    );
  }
}
