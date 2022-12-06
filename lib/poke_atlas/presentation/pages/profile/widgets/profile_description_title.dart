import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ProfileDescriptionTitle extends StatelessWidget {
  const ProfileDescriptionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Text(
          TextConstants.profileDescriptionTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
