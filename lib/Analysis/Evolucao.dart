import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gym/Analysis/Chart.dart';
import 'package:gym/User/UserConfig.dart';
import '../back/api.dart' as API;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Analysis/Chart.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';


// nao ta puxando param do home

class Evolucao extends StatefulWidget {
  const Evolucao({super.key});

  @override
  State<Evolucao> createState() => _EvolucaoState();
}

Future <List<Map<String, dynamic>>> getHistory(String userid) async {
  var url = Uri.https(API.uri, "/treinoshistory/${userid}");
  var response = await http.get(url);
  var data = json.decode(response.body);

  if (response.statusCode == 200 || response.statusCode == 202) {

    try {
      var data = json.decode(response.body);


      if (data is List) {
        print("sucesso");

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

Future <Map<String, dynamic>> getHistoryExe(String userid, int exeid) async {  // resposta vem a partir de um param, corrigir isso no back dps {resul: [{_id: 674e11de421b1db8d0556978, ca...} ou seja, obj com param
  var url = Uri.https(API.uri, "/exerciseshistoryE/${userid}/${exeid.toString()}");
  var response = await http.get(url);
  var data = json.decode(response.body);

  if (response.statusCode == 200 || response.statusCode == 202) {

    try {
      var data = json.decode(response.body);


      if (data == null){
        return {};
      }
      else {
        print(data);
        return Map<String, dynamic>.from(data);
      }
    } catch (e) {
      print("Erro ao decodificar resposta: $e");
      return {};
    }
  } else {
    print("Erro na API: ${response.statusCode} - ${response.body}");
    return {};
  }
}

class _EvolucaoState extends State<Evolucao> {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Text("Evolução")
    ),
    body: Column(
      children: [
        FutureBuilder(future: getHistory(Provider.of<UserProvider>(context, listen: false).UseriD), builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            print("results: ${snapshot.data}");
            List<Map<String, dynamic>> listaresul = snapshot.data ?? [];
            return Container(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: listaresul.map((item) {
                      var formatedDate = item["data"];
                      return Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text(formatedDate), Text(item["nome"])],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey
                        ),
                      );
                    }).toList()
                ),
              ),
            );
          }
          else {
            return Text("error");
          }
        }),
        Container(
            alignment: Alignment.center,
            height: 200,
            width: 350,
            child: FutureBuilder(future: getHistoryExe(Provider.of<UserProvider>(context, listen: false).UseriD, 15), builder: (context, snapshot) { // puxar dados certo revisa o processo pra manutenção

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<dynamic> lista = snapshot.data?["resul"];
                  print("lista: ${lista}");
                  List<FlSpot> spots = [];
                  for (var index = 0; index < lista.length; index ++) {
                    print(lista[index]["data"]);
                    spots.add(FlSpot((index * 5).toDouble(), (lista[index]["carga"]).toDouble()));
                    print(spots);
                  }
                  print(spots);
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Chart(spots: spots, data: snapshot.data?["data"] ?? DateTime.now())
                  );
                }
                else {
                  return Text("ta nul parcero");
                }
              }
              else {
                return Text("error exericio history ${snapshot.connectionState}");
              }
            }) // trocar iduser dps
        ),
      ],
    )
            )


      );
  }
}


