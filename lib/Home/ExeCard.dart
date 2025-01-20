import 'package:flutter/material.dart';
import 'package:gym/Home/ExercicioHow.dart';

class Execard extends StatefulWidget {
  final Map<String, dynamic> exedata;
  const Execard({super.key, required this.exedata});

  @override
  State<Execard> createState() => _ExecardState();
}

class _ExecardState extends State<Execard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Exerciciohow(exedata: widget.exedata)));},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 150,
        height: 190,
        child: Column(
          children: [
            Text(widget.exedata["nome"]),
            Image.network(widget.exedata["gif"], width: 150, height: 150,)
          ],

        ),
        decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(15), border: Border(), boxShadow: [BoxShadow(color: Colors.black)]),
      ),
    );
  }
}
