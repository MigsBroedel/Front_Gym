import 'package:flutter/material.dart';
import 'SearchBox.dart';
import 'InfoBoard.dart';
import 'CategorySpace.dart';
import 'AppBarHome.dart';



const arrList = ["Metas do mês", "Calendário", "Sua evolução", "Recordes pessoais"];

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            title: Appbarhome()
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Searchbox(),
              Categoryspace(),

              Transform.translate(offset: Offset(0, 20), child: Wrap(
                spacing: 26,
                runSpacing: 20,
                children: arrList.map((item) {
                  return Infoboard(item: item);
                }, ).toList(),)
                ),
        ]
        ),
      ),
    );
  }
}
