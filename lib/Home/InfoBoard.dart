import 'package:flutter/material.dart';

const arrayList = [""];


class Infoboard extends StatefulWidget {
  final Map<String, dynamic> item;
  const Infoboard({super.key, required this.item});

  @override
  State<Infoboard> createState() => _InfoboardState();
}

class _InfoboardState extends State<Infoboard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => widget.item.values.single));},
      child: Container(
          width: 400,
          height: 210,
          padding: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20)),

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text( widget.item.keys.single,
                style: TextStyle(color: Colors.white, fontSize: 20,), ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("",
                      style: TextStyle(color: Colors.white, fontSize: 15),)
                )]
          )),
    );

    }
}
