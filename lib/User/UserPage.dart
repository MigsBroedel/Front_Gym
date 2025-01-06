import 'package:flutter/material.dart';
import 'UserPhoto.dart';



class Userpage extends StatelessWidget {
  const Userpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 60),
      alignment: Alignment.center,
      child: Column(

          children: [
            Userphoto(),
            Chip(
              label: Text("Editar Perfil", style: TextStyle(color: Colors.white),),
              avatar: Icon(Icons.edit_sharp, color: Colors.white,),
              backgroundColor: Colors.indigo,
              labelPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            )
            // pensar em forma de disposição dos botoes e oq é importante ter em uma pagina de user, colocar mudanças de peso e tamanho aqui?

          ]
      ),
    );
  }
}
