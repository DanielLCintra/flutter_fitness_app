class Grupo {
  String nome;
  int idGrupo;

  Grupo({this.nome, this.idGrupo});

  Grupo.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idGrupo = json['id_grupo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['id_grupo'] = this.idGrupo;
    return data;
  }
}
