import 'package:flutter/material.dart';

class Saves 
{
  String ethicalStance;
  String question;
  String response;
  String iconPath; 
  Color boxColor;

  Saves
  (
    {
      required this.ethicalStance,
      required this.question,
      required this.response,
      required this.iconPath,
      required this.boxColor,
    }
  );

  static List<Saves> getSaves()
  {
    List<Saves> saves = [];

    saves.add
    (
      Saves
      (
        ethicalStance: 'For',
        question: 'Question 1',
        response: 'Response 1',
        iconPath: 'assets/images/agree.png',
        boxColor: Colors.pink
      )
    );
    saves.add
    (
      Saves
      (
        ethicalStance: 'Neutral',
        question: 'Question 2',
        response: 'Response 2',
        iconPath: 'assets/images/neutral.png',
        boxColor: Colors.blue
      )
    );
    saves.add
    (
      Saves
      (
        ethicalStance: 'Against',
        question: 'Question 3',
        response: 'Response 3',
        iconPath: 'assets/images/disagree.png',
        boxColor: Colors.green
      )
    );
    saves.add
    (
      Saves
      (
        ethicalStance: 'For',
        question: 'Question 4',
        response: 'Response 4',
        iconPath: 'assets/images/agree.png',
        boxColor: Colors.yellow
      )
    );

    return saves;
  }
}