import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Searchbox extends StatefulWidget {
  const Searchbox({super.key});
  @override
  _SearchboxState createState() => _SearchboxState();
}

class _SearchboxState extends State<Searchbox> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(

        height: 60,
        width: 320,
        child: Transform.translate(offset: Offset(0, 0), child: Chip(
            avatar: Transform.translate(offset: const Offset(-10, 0), child: Icon(Icons.search, color: Colors.black87, size: 25,),),
            label: Transform.translate(offset: const Offset(-10, 0), child: TextField(
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(
                  hintText: "Procure por algo mais especifico..."),
            ),
            ),
            labelStyle: TextStyle(color: Colors.black87, fontSize: 10),
            backgroundColor: Colors.black26,
            side: BorderSide(style: BorderStyle.none),
            padding: EdgeInsets.symmetric(horizontal: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))

        ),)
    );
  }
}