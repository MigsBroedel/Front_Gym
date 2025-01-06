import 'package:flutter/material.dart';

class Executarexebox extends StatefulWidget {
  final Map<String, dynamic> exercise;
  const Executarexebox({super.key, required this.exercise});

  @override
  State<Executarexebox> createState() => _ExecutarexeboxState();
}

class _ExecutarexeboxState extends State<Executarexebox> {
  @override
  Widget build(BuildContext context) {
    num index = 0;
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(widget.exercise["nome"]),
          Column(
            children: widget.exercise["series"].map((item) {
              index ++;
              return Row(
                children: [
                  Text(index.toString()),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "peso"
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "series"
                    ),

                  )
                ],
              );
            }),
          )

        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10)
            
      ),
    );
  }
}
