import 'package:flutter/material.dart';
import 'package:gym/Treinos/TreinoObj.dart';
import 'package:provider/provider.dart';
import '../back/api.dart' as API;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Treinos/ExercicioBox.dart';
import '../User/UserConfig.dart';
import '../Treinos/TreinoProvider.dart';


// ao inves de mostrar apenas os exercicio sque tem no treino, mostrar todos com a possibilidade de add mais, talvez seja demorado verificar um por um, achar um jeito melhor


Future <bool> DeleteTreino(String treinoid) async {
  var url = Uri.https(API.uri, "/treinos/${treinoid}");
  var response = await http.delete(url);
  if (response.statusCode == 200 || response.statusCode == 202) {
    print(response.body);
    return true;
  }
  else {
    return false;
  }
}

Future <bool> PutTreino(TreinoObj update) async {
  var url = Uri.https(API.uri, "/treinos");
  var body = jsonEncode({"userid": update.userId, "idtreino":update.id, "exercicios": update.exercicios, "nome": update.nome, "desc": update.desc});
  var response = await http.put(url,
      headers: {
        'Content-Type': 'application/json', // Informar que o body é JSON
      },
      body: body);
  if (response.statusCode == 200 || response.statusCode == 202) {
    print(response.body);
    return true;
  }
  else {
    return false;
  }
}

void CheckMethod (bool check, context) {
  if (check == true) {
    Navigator.pop(context);
  }
  else {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro no metodo")));
  }
}



class Edittreino extends StatefulWidget {
  final Map<String, dynamic> treino;

  const Edittreino({super.key, required this.treino});

  @override
  State<Edittreino> createState() => _EdittreinoState();
}




class _EdittreinoState extends State<Edittreino> {
  final TextEditingController _descControl = TextEditingController();
  final TextEditingController _nomeControl = TextEditingController();



  @override

  Widget build(BuildContext context) {
    _nomeControl.text = widget.treino["nome"];
    _descControl.text = widget.treino["desc"];
    var exercicioArr = widget.treino["exercicios"] ?? [];
    print("exercicioarr ${exercicioArr}");
    Provider.of<TreinoProvider>(context, listen: false).ListExercises = exercicioArr;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            title: Text("Criar Treinos")
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(

                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: 350,
                            child: TextField(
                              controller: _nomeControl,
                              textAlign: TextAlign.start,
                              showCursor: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: widget.treino["nome"],
                                  hintStyle: TextStyle(color: Colors.white)
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.indigo
                            ),),

                          Container(
                            width: 350,
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextField(
                              controller: _descControl,
                              textAlign: TextAlign.start,
                              showCursor: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: widget.treino["desc"],
                                  hintStyle: TextStyle(color: Colors.white)
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.indigo
                            ),
                          ),



                        ],
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 1,
                      runSpacing: 1,
                      alignment: WrapAlignment.start,
                      children: exercicioArr.map<Widget>((item) {

                        if (exercicioArr == null) {
                          return Center(child: Text("No exercises"),);
                        }
                        else {
                          return Exerciciobox(text: item['nome'] ?? "No name",
                              id: item['_id'] ?? "", checkstate: true,);
                        }
                      }).toList(),
                    ),


                  ]),
            ),

            Align(

              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      TreinoObj workout = TreinoObj(id: widget.treino["idtreino"], exercicios: exercicioArr, userId: widget.treino["userid"], nome: _nomeControl.text, desc: _descControl.text);
                      bool results = await PutTreino(workout);
                      CheckMethod(results, context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Center(
                        child: Text("Salvar", style: TextStyle(
                            color: Colors.white
                        ),),
                      ),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.black
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                    bool result = await DeleteTreino(widget.treino["idtreino"]);
                    CheckMethod(result, context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Center(
                        child: Text("Deletar", style: TextStyle(
                            color: Colors.white
                        ),),
                      ),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        )
    );
    }
  }
