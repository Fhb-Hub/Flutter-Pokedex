import 'package:flutter/material.dart';
import 'package:pokedex_manha/helpers/pokemon_helper.dart';
import 'package:pokedex_manha/models/pokemon_model.dart';
import 'package:pokedex_manha/widgets/metric_tile.dart';
import 'package:pokedex_manha/widgets/pokemon_header.dart';
import 'package:pokedex_manha/widgets/pokemon_stat_bar.dart';
import 'package:pokedex_manha/widgets/pokemon_type_chip.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel? pokemon;

  const DetailPage({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.pokemon!.name,
        style: TextStyle(
          fontFamily: 'PokemonHollow',
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Container(
          height: 52,
          width: 80,
          child: Center(
            child: Text(
              '#${widget.pokemon!.id.toString().padLeft(4, '0')}',
              style: TextStyle(
                fontFamily: 'PokemonSolid',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokemonHeader(
          backgroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
          imageUrl: widget.pokemon!.imageUrl,
        ),
        _buildTypes(),
        _buildMetrics(),
        _buildStats(),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Estatísticas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PokemonStatBar(
            label: 'HP',
            value: widget.pokemon!.health,
            foregroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
          ),
          PokemonStatBar(
            label: 'ATK',
            value: widget.pokemon!.attack,
            foregroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
          ),
          PokemonStatBar(
            label: 'DEF',
            value: widget.pokemon!.defense,
            foregroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
          ),
          PokemonStatBar(
            label: 'SPCATK',
            value: widget.pokemon!.specialAtt,
            foregroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
          ),
          PokemonStatBar(
            label: 'SPCDEF',
            value: widget.pokemon!.specialDef,
            foregroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
          ),
          PokemonStatBar(
            label: 'SPD',
            value: widget.pokemon!.speed,
            foregroundColor: PokemonHelper.getColor(widget.pokemon!.type1),
          ),
        ],
      ),
    );
  }

  Widget _buildTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PokemonTypeChip(type: widget.pokemon!.type1),
        widget.pokemon!.type2 != null ? SizedBox(width: 20) : SizedBox(),
        widget.pokemon!.type2 != null
            ? PokemonTypeChip(type: widget.pokemon!.type2)
            : SizedBox(),
      ],
    );
  }

  Widget _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MetricTile(
            value: widget.pokemon!.weight / 10,
            unit: 'kg',
            label: 'Peso',
          ),
        ),
        Expanded(
          child: MetricTile(
            value: widget.pokemon!.height / 10,
            unit: 'm',
            label: 'Altura',
          ),
        ),
      ],
    );
  }
}
