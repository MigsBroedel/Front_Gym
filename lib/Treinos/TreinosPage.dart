import 'package:flutter/material.dart';
import 'package:gym/Treinos/TreinoObj.dart';
import 'package:gym/Treinos/TreinoProvider.dart';
import '../Treinos/TreinoBox.dart';
import '../Treinos/AddTreinoPage.dart';
import '../back/api.dart' as API;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../User/UserConfig.dart';
import 'package:provider/provider.dart';


// erro no get dos treinos retorna null
// erro no post, em que não consegue mandar os exercicios


Future <List<Map<String, dynamic>>> getTreinos(TreinoProvider treinoPro) async {
  var url = Uri.https(API.uri, "/treinos/6761d5314c0dd726b523aef6"); // treinos:id
  var response = await http.get(url);

  var data = json.decode(response.body);

  if (response.statusCode == 200 || response.statusCode == 202) {

    try {
      var data = json.decode(response.body);
      print(data);

      if (data is List) {
        print("sucesso");
        treinoPro.ListWorkouts = List<Map<String, dynamic>>.from(data);

        return List<Map<String, dynamic>>.from(data);
      }
      if (data == null){
        return List<Map<String, dynamic>>.from([]);
      }
      else {
        throw Exception("WOW Resposta inesperada: $data");
      }
    } catch (e) {
      print("Erro ao decodificar resposta: $e");
      return [];
    }
  } else {
    print("Erro na API: ${response.statusCode} - ${response.body}");
    return [];
  }
}




class Treinospage extends StatelessWidget {
  const Treinospage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Text("Treinos")
    ),
    body: FutureBuilder(future: getTreinos(Provider.of<TreinoProvider>(context, listen: true)),
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        var index = -1;
        print(snapshot.data);
        if (snapshot.data == []) {
          return Center(
            child: const Text("Sem treinos por enquanto..."),
          );
        }
        else {
          return Stack(
            alignment: Alignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Column(
                          children: (snapshot.data?.map((item) {
                            index ++;
                            print("item: ${item}");
                            return Treinobox(obj: item,);
                          }).toList()) ?? [Center(child: Text(snapshot.data.toString()),)]
                      ),
                    ]

                ),
              ),

              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Addtreinopage()));},
                        child: Container(
                          alignment: Alignment.center,

                          width: 330,
                          height: 65,

                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(Icons.add, color: Colors.white,),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                        ),
                      ),

                    ],
                  )
              )
            ],
          );
        }
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        print("Carregando...");
        return CircularProgressIndicator();
      }
      else {
        return Text("Erro");
      }
    }
    ),);
  }
}
