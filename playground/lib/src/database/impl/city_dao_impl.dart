import 'package:playground_app/src/database/city_dao.dart';
import 'package:playground_app/src/database/db.dart';
import 'package:playground_app/src/models/city_model.dart';

class CityDaoImpl implements CityDao {
  final DB db;
  final _table = 'city';

  CityDaoImpl(this.db);

//   Future<Database> _database() async {
//     return await DB.instance.database;
//   }

//   @override
//   Future<CityModel> findById(id) async {
//     throw Error();
//   }

  @override
  Future<void> save(CityModel row) async {
    final database = await db.database;
    try {
      await database.insert(_table, row.toMap());
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<List<CityModel>> findAll() async {
    final database = await db.database;
    final result = await database.query(_table);
    final cities = result.map((e) => CityModel.fromMap(e)).toList();

    return cities;
  }

//   @override
//   Future<void> saveAll(List<CityModel> dtos) async {
//     var db = await DB.get();

//     for (var model in dtos) {
//       await db.delete(_table, where: 'id = ?', whereArgs: [model.id]);
//       await db.insert(_table, {
//         'id': model.id,
//         'name': model.nome,
//         'state': model.estado,
//         'ddd': model.ddd,
//         'code_erp': model.codigoErp,
//         'active': model.ativo,
//       });
//     }
//   }
}
