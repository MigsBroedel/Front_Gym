import 'package:flutter/material.dart';
import 'package:gym/Treinos/ExercicioObjHist.dart';
import 'package:gym/Treinos/TreinoProvider.dart';
import 'package:gym/User/UserConfig.dart';
import 'package:provider/provider.dart';
import '../back/api.dart' as API;

class Rowexe extends StatefulWidget {
  final num index;
  final num id;
  final String nome;
  const Rowexe({super.key, required this.index, required this.nome, required this.id});

  @override
  State<Rowexe> createState() => _RowexeState();
}






Map<String, dynamic> objExe  = {};

// o controller usa o ultimo valor pra mandar pro provider, ou seja, se a pessoa escrever 20 por ultimo e apneas assinalar a checkbox, ela vai mandar tudo 20, corrigir isso colocando o add na mudança do controller, ou alguma forma melhor


class _RowexeState extends State<Rowexe> {

  TextEditingController _pesoControl = TextEditingController();
  TextEditingController _repControl = TextEditingController();


  bool _isCheck = false;

  void _updateCheckbox(bool? value) {
    setState(() {
      _isCheck = value ?? false; // Atualiza o estado local
    });

    var provider = Provider.of<TreinoProvider>(context, listen: false);

    if (_isCheck) {
      // Adiciona o exercício ao ser marcado
      var obj = ExercicioObjHist(id: objExe["exercicioid"], serie: objExe["serie"], nome: objExe["nome"], carga: objExe["carga"], repeticoes: objExe["repeticoes"], userid: objExe["userid"]);
      provider.AddExDid(obj.toJson());
      print("lista did: ${provider.ListExercisesDid}");
    } else {
      // Remove o exercício ao ser desmarcado
      var obj = ExercicioObjHist(id: objExe["id"], serie: objExe["serie"], nome: objExe["nome"], carga: objExe["carga"], repeticoes: objExe["repeticoes"], userid: objExe["userid"]);
      provider.RmExDid(obj); // os 2 removes retornam erros
      print("lista did: ${provider.ListExercisesDid}");
    }
  }

  @override
  Widget build(BuildContext context) {

    objExe["serie"] = widget.index;
    objExe["nome"] = widget.nome;
    objExe["exercicioid"] = widget.id;
    objExe["userid"] = Provider.of<UserProvider>(context, listen: false).UseriD;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.index.toString()),

        SizedBox(
          width: 60,
          child: TextField(
            onChanged: (value) {
              setState(() {
                objExe["carga"] = value.isNotEmpty ? int.parse(value) : 0;
              });
            },
            controller: _pesoControl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true, // Compacta o campo
              contentPadding: EdgeInsets.all(8), // Ajusta o preenchimento
              hintText: "KG", // Placeholder
            ),
          ),

        ),

        SizedBox(
          width: 60,
          child: TextField(
            onChanged: (value) {
              setState(() {
                objExe["repeticoes"] = value.isNotEmpty ? int.parse(value) : 0;
              });
            },
            controller: _repControl,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true, // Compacta o campo
              contentPadding: EdgeInsets.all(8), // Ajusta o preenchimento
              hintText: "Rep", // Placeholder
            ),
          ),
        ),
        Checkbox(value: _isCheck, onChanged: (bool ? value) {
          setState(() {

            if (_pesoControl.text.isNotEmpty && _repControl.text.isNotEmpty) {
              _isCheck = value ?? false;
              _updateCheckbox(value);
            }
            else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Preencha os campos")));
            }
          });

        })
      ],
    );
  }
}
