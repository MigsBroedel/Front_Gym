import 'package:flutter/material.dart';
import 'package:gym/User/UserConfig.dart';
import 'package:provider/provider.dart';
import '../Home/Config.dart';
import 'package:http/http.dart' as http;
import '../back/api.dart' as API;
import 'dart:convert';





class Appbarhome extends StatefulWidget {
  const Appbarhome({super.key});

  @override
  State<Appbarhome> createState() => _AppbarhomeState();
}

class _AppbarhomeState extends State<Appbarhome> {
  late Future<String> _welcomeMessage;



  @override
  void initState() {
    super.initState();
    _welcomeMessage = _fetchname();
  }

  Future<String> _fetchname() async {
    var url = Uri.https(API.uri, "users/${Provider.of<UserProvider>(context, listen: false).UseriD}");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return "Bem vindo ${data['nome']}";
    } else {
      return "erro";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: _welcomeMessage,
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return CircularProgressIndicator(); // Exibe enquanto carrega
    } else if (snapshot.hasError) {
    return Text("Erro: ${snapshot.error}", style: TextStyle(fontSize: 5),);
    } else {
    return Wrap(
    spacing: 155,
    children: [
    Transform.translate(
    offset: Offset(0, 10),
    child: Text(
    snapshot.data ?? "Carregando...",
    style: TextStyle(
    color: Colors.indigo,
    fontWeight: FontWeight.bold,
    fontSize: 25,
    ),
    ),
    ),
    Config(), // Certifique-se de que Config está implementado
    ],
    );
    }
    },
    );
  }
}