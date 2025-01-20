import 'package:http/http.dart' as http;

num? findIdByName(List<Map<String, dynamic>> exercises, String name) {
  // Busca o exercício pelo nome e retorna o ID
  var exercise = exercises.firstWhere((exercise) => exercise['nome'] == name, orElse: () => {});

  if (exercise.isNotEmpty) {
    return exercise['_id'];
  } else {
    return null;
  }
}


final cli = http.Client();
final String uri = "api-gym-yt09.onrender.com";
final List<Map<String, dynamic>> exercises = [
  {
    "_id": 20,
    "categoria": "Core",
    "descricao": "Exercício isométrico para core, realizado no solo.",
    "nome": "Prancha",
    "gif": "https://static.wixstatic.com/media/2edbed_fbddee3b36d846f18fd052585d3ac120~mv2.jpg/v1/fill/w_300,h_168,al_c,q_80,enc_auto/2edbed_fbddee3b36d846f18fd052585d3ac120~mv2.jpg"
  },
  {
    "_id": 2,
    "categoria": "Peitoral",
    "descricao": "Exercício para peitoral superior, realizado em banco inclinado.",
    "nome": "Supino Inclinado",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/supino-inclinado-com-halteres.gif"
  },
  {
    "_id": 5,
    "categoria": "Pernas",
    "descricao": "Variação do agachamento em máquina, focando em quadríceps.",
    "nome": "Agachamento Hack",
    "gif": "https://www.hipertrofia.org/blog/wp-content/uploads/2023/03/sled-hack-squat.gif"
  },
  {
    "_id": 8,
    "categoria": "Braços",
    "descricao": "Exercício para bíceps, realizado com barra ou halteres.",
    "nome": "Rosca Direta",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/rosca-biceps-direta-na-barra-ez.gif"
  },
  {
    "_id": 9,
    "categoria": "Braços",
    "descricao": "Exercício para bíceps, realizado em banco scott para maior isolamento.",
    "nome": "Rosca Scott",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/11/Rosca-Scott-com-halteres-com-dois-bracos.gif"
  },
  {
    "_id": 13,
    "categoria": "Ombros",
    "descricao": "Exercício para deltoides laterais, realizado com halteres.",
    "nome": "Elevação Lateral",
    "gif": "https://www.treinoemalta.com.br/wp-content/uploads/2023/07/Elevacao-Lateral-com-Halteres.gif"
  },
  {
    "_id": 17,
    "categoria": "Pernas",
    "descricao": "Exercício composto para glúteos, posteriores e core, realizado com barra.",
    "nome": "Levantamento Terra",
    "gif": "https://www.hipertrofia.org/blog/wp-content/uploads/2017/11/barbell-deadlift.gif"
  },
  {
    "_id": 3,
    "categoria": "Peitoral",
    "descricao": "Exercício para peitoral inferior, realizado em banco declinado.",
    "nome": "Supino Declinado",
    "gif": "https://www.hipertrofia.org/blog/wp-content/uploads/2020/06/dumbbell-decline-bench-press.gif"
  },
  {
    "_id": 11,
    "categoria": "Braços",
    "descricao": "Exercício para tríceps, realizado com barra sobre a testa.",
    "nome": "Tríceps Testa",
    "gif": "https://www.hipertrofia.org/blog/wp-content/uploads/2024/02/barbell-lying-triceps-extension-skull-crusher.gif"
  },
  {
    "_id": 18,
    "categoria": "Pernas",
    "descricao": "Exercício para panturrilhas, realizado em máquina ou no smith.",
    "nome": "Panturrilha em Pé",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2021/03/Panturrilha-em-pe-no-aparelho.gif"
  },
  {
    "_id": 1,
    "categoria": "Peitoral",
    "descricao": "Exercício para peitoral, realizado em banco plano.",
    "nome": "Supino Reto",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/supino-reto.gif"
  },
  {
    "_id": 4,
    "categoria": "Pernas",
    "descricao": "Exercício para quadríceps, glúteos e core, realizado com barra nas costas.",
    "nome": "Agachamento Livre",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/11/agachamento-com-barra.gif"
  },
  {
    "_id": 6,
    "categoria": "Pernas",
    "descricao": "Exercício para quadríceps e glúteos, realizado em máquina inclinada.",
    "nome": "Leg Press 45º",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/pernas-leg-press-45-tradicional.gif"
  },
  {
    "_id": 7,
    "categoria": "Pernas",
    "descricao": "Exercício de isolamento para quadríceps, realizado em máquina.",
    "nome": "Cadeira Extensora",
    "gif": "https://media.tenor.com/bqKtsSuqilQAAAAM/gym.gif"
  },
  {
    "_id": 10,
    "categoria": "Braços",
    "descricao": "Exercício para tríceps, realizado em polia com barra reta ou corda.",
    "nome": "Tríceps Pulley",
    "gif": "https://static.wixstatic.com/media/2edbed_6cf28d186c0a4042bf6109575f7dbd82~mv2.gif"
  },
  {
    "_id": 12,
    "categoria": "Ombros",
    "descricao": "Exercício para ombros, realizado com barra sobre a cabeça.",
    "nome": "Desenvolvimento com Barra",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/ombros-desenvolvimento-de-ombros-frontal-com-barra.gif"
  },
  {
    "_id": 15,
    "categoria": "Costas",
    "descricao": "Exercício para dorsais, realizado em polia com pegada aberta.",
    "nome": "Puxada Frontal",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2020/12/costas-puxada-aberta-com-barra-no-pulley.gif"
  },
  {
    "_id": 19,
    "categoria": "Abdominais",
    "descricao": "Exercício para músculos abdominais superiores, realizado no chão ou máquina.",
    "nome": "Abdominal Supra",
    "gif": "https://www.mundoboaforma.com.br/wp-content/uploads/2023/02/47271301-abdominal-supra.gif"
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

