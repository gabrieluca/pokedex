import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class StatsTitle extends StatelessWidget {
  const StatsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Text(
          TextConstants.profileStatsTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
