import 'package:flutter/material.dart';
import './ExeCard.dart';
import '../back/api.dart' as API;

class Exerciciosguide extends StatelessWidget {
  const Exerciciosguide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Text("Exercicios")
    ),
      body: Container(
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 10,
            spacing: 7,
            alignment: WrapAlignment.spaceAround,
            children: API.exercises.map((item) {
              return Execard(exedata: item);
            }).toList(),
          ),
        )

    ));
  }
}
