library Constants;
import 'package:flutter/material.dart';
const String MODE_FACILE="2 vies\t- 1 bloc éclairé";
const String MODE_DIFFICILE="2 vies\t3 blocs éclairés";
const String MODE_EXPERT="3 vies\t5 blocs éclairés";
const String MODE_CHRONO="3 vies\tTemps de réponse limité";

const String TITLE_TEXT="Jeux de couleurs";
const String LEVEL_TEXT="Niveau : ";
const String LIFE_TEXT="Vie : ";


const kHeightSpacer = const SizedBox(
  height: 30.0,
);

const kWidthSpacer = const SizedBox(
  width: 30,
);

const kAnimatedOpacityDuration = const Duration(milliseconds: 400);

const kDelayedOpacityDuration = const Duration(milliseconds: 400);

enum OpacityColor { green, red, yellow, blue }