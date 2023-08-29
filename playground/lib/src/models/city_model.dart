// ignore_for_file: public_member_api_docs, sort_constructors_first
class CityModel {
  final int id;
  final int codeErp;
  final String name;
  final String uf;
  final bool active;

  CityModel({
    required this.id,
    required this.codeErp,
    required this.name,
    required this.uf,
    required this.active,
  });

  factory CityModel.fromMap(dynamic json) {
    return switch (json) {
      {
        'id': int id,
        'codigoErp': int codeErp,
        'nome': String name,
        'estado': String uf,
        'ativo': bool active,
      } =>
        CityModel(
          id: id,
          codeErp: codeErp,
          name: name,
          uf: uf,
          active: active,
        ),
      _ => throw ArgumentError('Invalid JSON'),
    };
  }

  factory CityModel.fromMapEntity(dynamic map) {
    return CityModel(
      id: map['id'] as int,
      codeErp: map['codeErp'] as int,
      name: map['name'] as String,
      uf: map['uf'] as String,
      active: ((map['active'] as int) == 1) ? true : false,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'codeErp': codeErp,
      'name': name,
      'uf': uf,
      'active': active,
    };
  }
}
