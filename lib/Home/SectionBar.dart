import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var arrayList = ["Resumo geral","Corrida","Musculação", "Opções"];

class Sectionbar extends StatefulWidget {

  const Sectionbar({super.key});



  @override
  State<Sectionbar> createState() => _SectionbarState();
}

class _SectionbarState extends State<Sectionbar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
          spacing: -75,
          children: arrayList.map((item) {
            return SizedBox(
                width: 400, // Largura do Chip
                height: 75, // Altura do Chip
                child: Chip(label: Text(item),

                    labelStyle: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5
                    ),
                    backgroundColor: Colors.black,
                    side: BorderSide(style: BorderStyle.none),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))

                ));
          }).toList()),
    );
  }
}
