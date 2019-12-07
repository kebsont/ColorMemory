library Constants;
import 'package:flutter/material.dart';
const String MODE_FACILE="2 vies\t- 1 bloc éclairé";
const String MODE_DIFFICILE="2 vies\t- 3 blocs éclairés";
const String MODE_EXPERT="3 vies\t- 5 blocs éclairés";
const String MODE_CHRONO="3 vies\t- Temps de réponse limité";

const String TITLE_TEXT="Jeux de couleurs";
const String LEVEL_TEXT="Niveau : ";
const String LIFE_TEXT="Vie : ";

const String INFO_GAME_PROGRESS= "Partie en cours";
const String INFO_WELL_PLAYED= "Bien joué !";
const String INFO_YOUR_TURN= "A vous de jouer !";
const String INFO_LOSE_LIFE="Vous avez perdu une vie";
const String INFO_LOSE_GAME="Vous avez perdu la partie";
const String INFO_WIN_GAME="Félicitation, vous avez gagné";


const kHeightSpacer = const SizedBox(
  height: 30.0,
);

const kWidthSpacer = const SizedBox(
  width: 30,
);

const int i_kAnimatedOpacityDuration = 300;
const kAnimatedOpacityDuration = const Duration(milliseconds: i_kAnimatedOpacityDuration);

const kDelayedOpacityDuration = const Duration(milliseconds: 300);

enum OpacityColor { green, red, yellow, blue, grey, orange, pink, black, lightGreen, purple, teal, brown }

const Color COLOR_BASE = Color.fromRGBO(255, 140, 0, .8);