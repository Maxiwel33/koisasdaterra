import 'package:koisasdaterra/pages/user_model.dart';
import 'package:koisasdaterra/src/auth/mysql_conexao.dart';
import 'package:mysql1/mysql1.dart';

Future<List<UserModel>> getmySQLData() async {
  var db = Mysql();
  String sql = 'select * from tblprodutos;';

  final List<UserModel> mylist = [];
  await db.getConnection().then((conn) async {
    await conn.query(sql).then((results) {
      for (var row in results) {
        // print(row[0]);
        // mylist.add(row['id_produto'].toString());

        final UserModel estoque = UserModel(
            id_produto: row['id_produto'].toString(),
            nome: row['nome'].toString(),
            codigo_barra: row['codigo_barra'].toString());
        mylist.add(estoque);
      }
    }).onError((error, stackTrace) {
      print(error);
      return null;
    });
    conn.close;
  });
  return mylist;
}
