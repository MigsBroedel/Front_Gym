import 'dart:ffi';

import 'package:flutter/material.dart';

// renderizar box a cada exercicio e ter a possibilidade de adicionar mais series, depois de tudo, criar obj de treino todo e mandar pro historico de treino e cada exercicio pro historico de exericio

class ExecutarPage extends StatefulWidget {
  final Map<String, dynamic> ObjTreino;
  const ExecutarPage({super.key, required this.ObjTreino});

  @override
  State<ExecutarPage> createState() => _ExecutarPageState();
}

class _ExecutarPageState extends State<ExecutarPage> {

  @override
  Widget build(BuildContext context) {
    var exercicioArr = widget.ObjTreino["exercicios"] ?? [];
    print("exercises vsao exe: ${exercicioArr}");
    num series = 0;
    exercicioArr.map((item) {
      series = series + item["series"];

    });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Text("Treinamento")
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 30,
            spacing: 45,
            children: [
              Text("Nome: ${widget.ObjTreino["nome"]}", style: TextStyle(color: Colors.white),),
              Text("Tempo: ", style: TextStyle(color: Colors.white),),
              Text("Volume: ", style: TextStyle(color: Colors.white),),
              Text("Series: ${series}", style: TextStyle(color: Colors.white),),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)

          ),
        ),


      ],
    ));
  }
}
