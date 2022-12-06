import 'package:flutter/material.dart';

import '../../../../domain/entitites/pokemon_detail.dart';

class ProfileDescriptionBody extends StatelessWidget {
  const ProfileDescriptionBody(
    this.description, {
    super.key,
  });

  final Description? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            description ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
