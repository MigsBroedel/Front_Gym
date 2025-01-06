import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Categoryspace extends StatefulWidget {
  const Categoryspace({super.key});

  @override
  State<Categoryspace> createState() => _CategoryspaceState();
}

class _CategoryspaceState extends State<Categoryspace> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [Transform.translate(
        offset: Offset(-20, 20),
        child: Text("Categorias: ",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )),
    Transform.translate(offset: Offset(10, 20), child: TextButton(onPressed: () => {print("Inutil")}, child: Text("Ver todas >", style: TextStyle(color: Colors.black38, fontSize: 15),),
      ),
    )
    ],
      spacing: 40,
    );
  }
}
