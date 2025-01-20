import 'dart:ffi';

import '../back/api.dart' as API;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:gym/User/UserConfig.dart';
import 'package:fl_chart/fl_chart.dart';
import '../Analysis/Chart.dart';
import 'package:flutter/material.dart';

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

class Chartinvoquer extends StatelessWidget {
  final int exeid;
  const Chartinvoquer({super.key, required this.exeid});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getHistoryExe(Provider.of<UserProvider>(context, listen: false).UseriD, exeid), builder: (context, snapshot) { // puxar dados certo revisa o processo pra manutenção

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
    }); // trocar iduser dps;
  }
}
