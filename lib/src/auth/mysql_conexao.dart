import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'http://localhost/flutter/conexao.php',
      user = 'root',
      password = '',
      db = 'estoque';

  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );

    return MySqlConnection.connect(settings);
  }
}
