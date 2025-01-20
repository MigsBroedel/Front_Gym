import 'package:flutter/material.dart';
import 'package:gym/Treinos/ExecutarPage.dart';
import 'package:gym/Treinos/TreinoProvider.dart';
import '../Treinos/EditTreino.dart';
import 'package:provider/provider.dart';

class Treinobox extends StatefulWidget {
  final Map<String, dynamic> obj;
  const Treinobox({super.key, required this.obj});

  @override
  State<Treinobox> createState() => _TreinoboxState();
}

class _TreinoboxState extends State<Treinobox> {
  @override
  Widget build(BuildContext context) {
    //print("OBJJJ:${widget.obj}");
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Edittreino(treino: widget.obj,)));
      },

      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10),

        width: 330,
        height: 110,

        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(widget.obj["nome"], style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600, fontSize: 23),),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ExecutarPage(ObjTreino: widget.obj)));
              },
                child: Text("Executar"))
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black38,
        ),
      ),
    );

  }
}
