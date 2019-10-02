import './group.dart';

class Food {
  String nome;
  int calorias;
  int idAlimento;
  int idGrupo;
  Group grupo;

  Food({this.nome, this.calorias, this.idAlimento, this.idGrupo});

  Food.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    calorias = json['calorias'];
    idAlimento = json['id_alimento'];
    idGrupo = json['id_grupo'];
    grupo = json['grupo'] != null ? new Group.fromJson(json['grupo']) : null;
  }
}
