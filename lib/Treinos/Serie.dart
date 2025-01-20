import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gym/Treinos/RowExe.dart';
import '../Treinos/ExercicioObjHist.dart';
import '../back/api.dart' as API;

class Serie extends StatefulWidget {

  final Map<String, dynamic> exercise;
  final index;
  const Serie({super.key, required this.exercise, required this.index});

  @override
  State<Serie> createState() => _SerieState();
}

// manage vars and objects to concentrate all in one object to send to post method

// c

class _SerieState extends State<Serie> {

  @override
  Widget build(BuildContext context) {

    var series = widget.exercise["series"];
    var objid = API.findIdByName(API.exercises, widget.exercise["nome"]);


    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.maxFinite,
      child: Wrap(
        runSpacing: 10,
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        children: [
          Text(widget.exercise["nome"]),
          GestureDetector(
            child: Icon(Icons.info_outline, size: 20,)
          ),
          for (int i = series; i > 0; i--)

            Rowexe(id: objid ?? 9, nome: widget.exercise["nome"], index: i)



        ]),
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15)
        )

    );
  }
}
