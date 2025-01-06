import 'package:flutter/material.dart';

const arrayList = [""];


class Infoboard extends StatefulWidget {
  final String item;
  const Infoboard({super.key, required this.item});

  @override
  State<Infoboard> createState() => _InfoboardState();
}

class _InfoboardState extends State<Infoboard> {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: 210,
        padding: EdgeInsets.all(20),
    alignment: Alignment.topLeft,
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(20)),

    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text( widget.item,
    style: TextStyle(color: Colors.white, fontSize: 20,), ),
    Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Text("",
    style: TextStyle(color: Colors.white, fontSize: 15),)
    )]
    ));

    }
}
