import 'package:flutter/material.dart';
import 'package:koisasdaterra/pages/user_model.dart';
import 'package:koisasdaterra/src/auth/mysql_conexao.dart';

class MysqlResposta extends StatefulWidget {
  const MysqlResposta({super.key});

  @override
  State<MysqlResposta> createState() => _MysqlRespostaState();
}

Future<List<UserModel>> getmySQLData() async {
  var db = Mysql();

  String sql = 'select * from tblprodutos;';

  final List<UserModel> mylist = [];

  await db.getConnection().then((conn) async {
    await conn.query(sql).then((results) {
      for (var row in results) {
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
    conn.close();
  });
  return mylist;
}

class _MysqlRespostaState extends State<MysqlResposta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha conexao'),
      ),
      body: Center(
        child: showFutureDBData(),
      ),
    );
  }
}

showFutureDBData() {
  return FutureBuilder<List<UserModel>>(
      future: getmySQLData(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final user = snapshot.data![index];
            return ListTile(
              leading: Text(user.id_produto),
              title: Text(user.nome),
              subtitle: Text(user.codigo_barra),
            );
          },
        );
      });
}
