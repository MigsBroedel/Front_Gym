import 'package:flutter/material.dart';
import 'package:gym/Treinos/ExercicioObj.dart';
import 'package:gym/Treinos/TreinoProvider.dart';
import 'package:provider/provider.dart';
import 'package:numberpicker/numberpicker.dart';

class Exerciciobox extends StatefulWidget {
  final String text;
  final String id;
  final bool checkstate;
  const Exerciciobox({
    super.key,
    required this.text,
    required this.id,
    this.checkstate = false,
  });

  @override
  State<Exerciciobox> createState() => _ExercicioboxState();
}

class _ExercicioboxState extends State<Exerciciobox> {
  late bool _isCheck; // Estado local do Checkbox
  int _series = 1; // Valor inicial do NumberPicker

  @override
  void initState() {
    super.initState();
    _isCheck = widget.checkstate; // Inicializa o estado como falso ou valor passado
  }

  void _updateCheckbox(bool? value) {
    setState(() {
      _isCheck = value ?? false; // Atualiza o estado local
    });

    var provider = Provider.of<TreinoProvider>(context, listen: false);

    if (_isCheck) {
      // Adiciona o exercício ao ser marcado
      var obj = ExercicioObj(id: widget.id, nome: widget.text, series: _series);
      provider.AddEx(obj.toJson());
    } else {
      // Remove o exercício ao ser desmarcado
      var obj = ExercicioObj(id: widget.id, nome: widget.text);
      provider.RmEx(obj);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 268,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                widget.text,
                style: const TextStyle(fontSize: 10),
              ),
              Image.network(
                "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/supino-reto.gif",
                width: 100,
                height: 200,
              ),
            ],
          ),
          Checkbox(
            value: _isCheck,
            onChanged: _updateCheckbox,
          ),
          NumberPicker(
            minValue: 1,
            maxValue: 5,
            value: _series,
            onChanged: (value) => setState(() {
              _isCheck = false;
              _series = value; // Atualiza o número de séries
            }),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
    );
  }
}
