import 'package:http/http.dart' as http;

final cli = http.Client();
final String uri = "api-gym-yt09.onrender.com";
final exercises = [
  {
    "_id": "14",
    "categoria": "Costas",
    "descricao": "Exercício para costas, realizado com barra ou halteres.",
    "nome": "Remada Curvada"
  },
  {
    "_id": "16",
    "categoria": "Costas",
    "descricao": "Exercício para dorsais e romboides, realizado com halteres.",
    "nome": "Remada Unilateral"
  },
  {
    "_id": "20",
    "categoria": "Core",
    "descricao": "Exercício isométrico para core, realizado no solo.",
    "nome": "Prancha"
  },
  {
    "_id": "2",
    "categoria": "Peitoral",
    "descricao": "Exercício para peitoral superior, realizado em banco inclinado.",
    "nome": "Supino Inclinado"
  },
  {
    "_id": "5",
    "categoria": "Pernas",
    "descricao": "Variação do agachamento em máquina, focando em quadríceps.",
    "nome": "Agachamento Hack"
  },
  {
    "_id": "8",
    "categoria": "Braços",
    "descricao": "Exercício para bíceps, realizado com barra ou halteres.",
    "nome": "Rosca Direta"
  },
  {
    "_id": "9",
    "categoria": "Braços",
    "descricao": "Exercício para bíceps, realizado em banco scott para maior isolamento.",
    "nome": "Rosca Scott"
  },
  {
    "_id": "13",
    "categoria": "Ombros",
    "descricao": "Exercício para deltoides laterais, realizado com halteres.",
    "nome": "Elevação Lateral"
  },
  {
    "_id": "17",
    "categoria": "Pernas",
    "descricao": "Exercício composto para glúteos, posteriores e core, realizado com barra.",
    "nome": "Levantamento Terra"
  },
  {
    "_id": "3",
    "categoria": "Peitoral",
    "descricao": "Exercício para peitoral inferior, realizado em banco declinado.",
    "nome": "Supino Declinado"
  },
  {
    "_id": "11",
    "categoria": "Braços",
    "descricao": "Exercício para tríceps, realizado com barra sobre a testa.",
    "nome": "Tríceps Testa"
  },
  {
    "_id": "18",
    "categoria": "Pernas",
    "descricao": "Exercício para panturrilhas, realizado em máquina ou no smith.",
    "nome": "Panturrilha em Pé"
  },
  {
    "_id": "1",
    "categoria": "Peitoral",
    "descricao": "Exercício para peitoral, realizado em banco plano.",
    "nome": "Supino Reto"
  },
  {
    "_id": "4",
    "categoria": "Pernas",
    "descricao": "Exercício para quadríceps, glúteos e core, realizado com barra nas costas.",
    "nome": "Agachamento Livre"
  },
  {
    "_id": "6",
    "categoria": "Pernas",
    "descricao": "Exercício para quadríceps e glúteos, realizado em máquina inclinada.",
    "nome": "Leg Press 45º"
  },
  {
    "_id": "7",
    "categoria": "Pernas",
    "descricao": "Exercício de isolamento para quadríceps, realizado em máquina.",
    "nome": "Cadeira Extensora"
  },
  {
    "_id": "10",
    "categoria": "Braços",
    "descricao": "Exercício para tríceps, realizado em polia com barra reta ou corda.",
    "nome": "Tríceps Pulley"
  },
  {
    "_id": "12",
    "categoria": "Ombros",
    "descricao": "Exercício para ombros, realizado com barra sobre a cabeça.",
    "nome": "Desenvolvimento com Barra"
  },
  {
    "_id": "15",
    "categoria": "Costas",
    "descricao": "Exercício para dorsais, realizado em polia com pegada aberta.",
    "nome": "Puxada Frontal"
  },
  {
    "_id": "19",
    "categoria": "Abdominais",
    "descricao": "Exercício para músculos abdominais superiores, realizado no chão ou máquina.",
    "nome": "Abdominal Supra"
  }
];






  /*factory Client.fromJson(Map<String, dynamic> json) {
    return User(
      nome: json['nome']
          userid: json['userid']
    );
  }*/

  /*Map<String, dynamic> toJson() {
    return {
      'x' = x
    }
  } */



/*class User {
  String nome;
  String userid;

  User({required this.nome, required this.userid})
}*/

