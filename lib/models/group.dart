class Group {
  String nome;
  int idGrupo;

  Group({this.nome, this.idGrupo});

  Group.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idGrupo = json['id_Group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['id_grupo'] = this.idGrupo;
    return data;
  }
}
