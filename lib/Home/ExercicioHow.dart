import 'package:flutter/material.dart';
import '../Analysis/ChartInvoquer.dart';





class Exerciciohow extends StatelessWidget {
  final Map<String, dynamic> exedata;
  const Exerciciohow({super.key, required this.exedata});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            title: Text(exedata["nome"])
        ),
        body: Column(
          children: [
            Image.network(exedata["gif"], width: 300, height: 300),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categoria: ${exedata["categoria"]}", style: TextStyle(fontSize: 20),),
                  Text("Descrição: ${exedata["descricao"]}", style: TextStyle(fontSize: 20),),
                  //Chartinvoquer(exeid: exedata["_id"],) o chart não é invocado dentro de um widget que organiza espaço

                ],
              ),
              decoration: BoxDecoration(color: Colors.grey),
            )
          ],
        )
    );
  }
}
