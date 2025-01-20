import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gym/Treinos/Serie.dart';
import 'package:gym/Treinos/TreinoObj.dart';
import 'package:gym/Treinos/TreinoProvider.dart';
import 'package:gym/User/UserConfig.dart';
import 'package:http/http.dart' as http;
import '../back/api.dart' as API;
import 'package:provider/provider.dart';
import 'dart:convert';


// renderizar box a cada exercicio e ter a possibilidade de adicionar mais series, depois de tudo, criar obj de treino todo e mandar pro historico de treino e cada exercicio pro historico de exericio

// o plano é criar um array de objetos exercicio e ir adicionando no loop for, assim, no final do treino, é so colocar o array como exercicio list

// analisa o fluxo de dados e tipos, tem algo errado passando que esta travando o processo

Future <dynamic> PostTreinoExe (TreinoObj obj) async {
  var url = Uri.https(API.uri, "/treinoshistory/${obj.userId}/${obj.id}");
  var body = json.encode({"idtreino": obj.id, "userid": obj.userId, "nome": obj.nome, "desc": obj.desc, "exercicios": obj.exercicios});
  print("EXECUTAR EXE: ${obj.exercicios}");
  var response = await http.post(url,
      headers: {
        'Content-Type': 'application/json', // Informar que o body é JSON
      },
      body: body);
  if (response.statusCode == 200 || response.statusCode == 202) {
    return true;
  }
  print("response uou ${response.body}");
  return response.body;
}



class ExecutarPage extends StatefulWidget {
  final Map<String, dynamic> ObjTreino;
  const ExecutarPage({super.key, required this.ObjTreino});

  @override
  State<ExecutarPage> createState() => _ExecutarPageState();
}

class _ExecutarPageState extends State<ExecutarPage> {

  @override
  Widget build(BuildContext context) {
    var index = 0;
    print(Provider.of<TreinoProvider>(context, listen: false).ListExercisesDid);
    var exercicioArr = widget.ObjTreino["exercicios"] ?? [];
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
    body: SingleChildScrollView(
      child: Column(
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

          Wrap(
            runSpacing: 20,
            children: widget.ObjTreino["exercicios"].map<Widget>((item) {
              index++;
              return Serie(exercise: item, index: index);
            }).toList(),

          ),

          GestureDetector(
            onTap: () async {
              var userId = Provider.of<UserProvider>(context, listen: false).UseriD;
              var TreinoPro = Provider.of<TreinoProvider>(context, listen: false);
              try {
                var treinoobj = TreinoObj(id: widget.ObjTreino["idtreino"], exercicios: TreinoPro.ListExercisesDid, userId: userId, nome: widget.ObjTreino["nome"], desc: widget.ObjTreino["desc"]);
                print("objtreino: ${treinoobj}");
                var creT = await PostTreinoExe(treinoobj); // fazer verificação e mudar de pagina quando terminar
                if (creT == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sucesso.")));
                  TreinoPro.ListExercisesDid = [];
                  print("Treino adicionado: ${creT.toString()}");
                  Navigator.pop(context);
                }
                else {
                  print('Erro na criação do treino: ${creT}'); // error here
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
              height: 50,
              width: double.maxFinite,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text("Finalizar treino", style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          )




        ],
      ),
    ));
  }
}
