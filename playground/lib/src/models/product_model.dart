// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int id;
  final int codeErp;
  final String description;

  ProductModel({
    required this.id,
    required this.codeErp,
    required this.description,
  });

  factory ProductModel.fromMap(dynamic json) {
    return switch (json) {
      {
        'id': int id,
        'codigoErp': int codeErp,
        'descricao': String description,
      } =>
        ProductModel(
          id: id,
          codeErp: codeErp,
          description: description,
        ),
      _ => throw ArgumentError('Invalid Json'),
    };
  }
}
