import './grupo.dart';

class Food {
  String nome;
  int calorias;
  int idAlimento;
  int idGrupo;
  Grupo grupo;

  Food({this.nome, this.calorias, this.idAlimento, this.idGrupo});

  Food.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    calorias = json['calorias'];
    idAlimento = json['id_alimento'];
    idGrupo = json['id_grupo'];
    grupo = json['grupo'] != null ? new Grupo.fromJson(json['grupo']) : null;
  }
}
