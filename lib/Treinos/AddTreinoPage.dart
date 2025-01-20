import 'package:flutter/material.dart';
import 'package:gym/Treinos/ExercicioBox.dart';
import 'package:gym/Treinos/ExercicioObj.dart';
import 'package:gym/Treinos/TreinoObj.dart';
import 'package:gym/Treinos/TreinoProvider.dart';
import 'package:gym/Treinos/TreinosPage.dart';
import 'package:gym/User/UserConfig.dart';
import 'package:http/http.dart' as http;
import '../back/api.dart' as API;
import 'package:provider/provider.dart';
import 'dart:convert';


// adicionar exercicio ao treino ta com problems

Future<dynamic> _CreateWorkout (TreinoObj obj) async {
  List<dynamic> exerciseArr = obj.exercicios;
  var body = json.encode({"userid": obj.userId, "nome": obj.nome, "desc": obj.desc, "exercicios": exerciseArr});
  var url = Uri.https(API.uri, "/treinos");
  var response = await http.post(url,
      headers: {
        'Content-Type': 'application/json', // Informar que o body é JSON
      },
      body: body);
  if (response.statusCode == 200 || response.statusCode == 202) {
    return true;
  }
  return response.body;
}




class Addtreinopage extends StatefulWidget {

  const Addtreinopage({super.key});

  @override
  State<Addtreinopage> createState() => _AddtreinopageState();

}

class _AddtreinopageState extends State<Addtreinopage> {
  final TextEditingController _nomeControl = TextEditingController();
  final TextEditingController _descControl = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var TreinoPro = Provider.of<TreinoProvider>(context, listen: false);


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            title: Text("Criar Treinos")
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                Align(
            alignment: Alignment.center,
            child: Column(

              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 350,
                  child: Transform.translate(offset: Offset(9, 0),
                    child: TextField(
                      controller: _nomeControl,
                      textAlign: TextAlign.start,
                      showCursor: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nome: ",
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo
                  ),),

                Container(
                  width: 350,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Transform.translate(offset: Offset(9, 0),
                    child: TextField(
                      controller: _descControl,
                      textAlign: TextAlign.start,
                      showCursor: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Descrição: ",
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    ),),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo
                  ),
                ),

                GestureDetector(
                  //onTap: () {print(Provider.of<TreinoProvider>(context, listen: false).ListExercises[0].series);},

                  onTap: () async {
                    var userId = Provider.of<UserProvider>(context, listen: false).UseriD;
                    print("listADd: ${TreinoPro.ListExercises}");
                    try {
                      var treinoobj = TreinoObj(id: "", exercicios: TreinoPro.ListExercises, userId: userId, nome: _nomeControl.text, desc: _descControl.text);
                      var creT = await _CreateWorkout(treinoobj); // fazer verificação e mudar de pagina quando terminar
                      if (creT == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Sucesso.")));
                        TreinoPro.ListExercises = [];
                        print("Treino adicionado: ${creT.toString()}");
                        Navigator.pop(context);
                      }
                      else {
                        print('Erro na criação do treino: ${creT}');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Falha na criação de treino. Tente novamente.")));
                      }
                    }
                    catch (erro) {
                      print('Erro na criação do treino: $erro');
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Erro: $erro")));
                    }


                    },
                  child: Container(
                    alignment: Alignment.center,

                    width: 330,
                    height: 65,

                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Adicionar treino", style: TextStyle(color: Colors.white),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
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
                  children: API.exercises.map((item) {
                    return Exerciciobox(text: item["nome"] ?? "no name", id: item['_id'] ?? 0, gif: item['gif'] ?? "");
                  }).toList() ?? [],
                ),
        ]),
    )
    );


  }
}
