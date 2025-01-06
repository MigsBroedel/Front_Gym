import 'dart:convert';
import 'package:gym/User/UserConfig.dart';
import 'package:http/http.dart' as http;
import '../back/api.dart' as API;
import 'package:flutter/material.dart';
import '../Global/main.dart';
import 'package:provider/provider.dart';

class Authpage extends StatefulWidget {
  // auth normal -> http get das info e comparar, ou criar metodo no back, pra comparar, melhor
  // auth google -> oauth
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();








  Future<bool> _AuthUser (username, password) async {
    var body = json.encode({"email": username, "senha": password});
    var url = Uri.https(API.uri, "users/auth");
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json', // Informar que o body é JSON
        },
        body: body);
    if (response.statusCode == 200 || response.statusCode == 202) {
      return true;
    }
    return false;
  }


  void VerifyandPage (check) {
    if (check) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sucesso.")));
      Provider.of<UserProvider>(context, listen: false).login();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Falha na autenticação. Tente novamente.")));
    }
  }


  void LogNormal () {

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
            child: Container(
              width: 300,
              height: 545,
              child: Column(
                children: [
                  Transform.translate(offset: Offset(75, 30), child: Container(
                    width: 350,
                    height: 30,
                    child: Text("Seja bem vindo! ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)

                  ),
                  Transform.translate(offset: Offset(17, 25), child: Container(
                    width: 350,
                    height: 30,
                    child: Text("Por acaso ja te conhecemos?",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),)

                  ),


                  Transform.translate(offset: Offset(0, 100), child: Container(
                    height: 35,
                    width: 275,
                    child: Transform.translate(offset: Offset(9, 0), child:
                    TextField(
                      controller: _email,
                      textAlign: TextAlign.start,
                      showCursor: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email: "
                      ),
                    ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black26
                    ),
                  ),
                  ),
                  Transform.translate(offset: Offset(0, 120), child: Container(
                    height: 35,
                    width: 275,
                    child: Transform.translate(offset: Offset(9, 0), child:
                    TextField(
                      controller: _password,
                      textAlign: TextAlign.start,
                      showCursor: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Senha: "
                      ),
                    ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black26
                    ),
                  ),
                  ),

                  Transform.translate(offset: Offset(0, 135), child: ElevatedButton(
                      onPressed: () async {
                        bool result = await _AuthUser(_email.text, _password.text);
                        VerifyandPage(result);
                      },
                      child: Text("Entrar", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 3, color: Color(0xFF000000)),
                          fixedSize: Size(220, 30),
                          backgroundColor: Colors.white
                      )),),



                  Transform.translate(offset: Offset(0, 145), child: Text("Ou"),),

                  Transform.translate(offset: Offset(0, 155), child: ElevatedButton(
                      onPressed: LogNormal,
                      child: Text("Logar com Google", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 30),
                          backgroundColor: Colors.black26
                      )),),

                  Transform.translate(offset: Offset(0, 165), child: ElevatedButton(
                      onPressed: LogNormal,
                      child: Text("Logar com Apple", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 30),
                          backgroundColor: Colors.black26
                      )),),

                  Transform.translate(offset: Offset(0, 175), child: Text("Não tem uma conta?")),

                  Transform.translate(offset: Offset(0, 175), child: ElevatedButton(
                      onPressed: LogNormal,
                      child: Text("Cadastre-se", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 3, color: Color(0xFF000000)),
                          fixedSize: Size(220, 30),
                          backgroundColor: Colors.white
                      )),),



                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)


              ),
            )
        ), ),
    );
  }
}
