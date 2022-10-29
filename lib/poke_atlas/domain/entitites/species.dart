class SpeciesEntity {
  SpeciesEntity({
    this.flavorTextEntries,
  });

  final List<FlavorTextEntry>? flavorTextEntries;

  factory SpeciesEntity.fromMap(Map<String, dynamic> map) => SpeciesEntity(
        flavorTextEntries: List<FlavorTextEntry>.from(
          map['flavor_text_entries'].map((x) => FlavorTextEntry.fromMap(x)),
        ),
      );
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
  });

  final String? flavorText;

  factory FlavorTextEntry.fromMap(Map<String, dynamic> map) => FlavorTextEntry(
        flavorText: map['flavor_text'],
      );
}
