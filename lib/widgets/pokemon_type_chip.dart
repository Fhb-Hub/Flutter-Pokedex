import 'package:flutter/material.dart';

import 'package:pokedex_manha/helpers/pokemon_type_helper.dart';

class PokemonTypeChip extends StatelessWidget {
  final String? type;

  const PokemonTypeChip({
    Key? key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Text(
        PokemonTypeHelper.getIcon(type!),
        style: TextStyle(
          fontFamily: 'PokeGoTypes',
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      label: Text(
        type!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      backgroundColor: PokemonTypeHelper.getColor(type!),
    );
  }
}
