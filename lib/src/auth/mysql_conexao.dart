import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '192.168.0.117', // ESSE É O IP ONDE SE LOCALIZA O BANCO
      // SE UTILIZAR UM EMULADOR SIGNIFICA Q ESTA COMPARTILHANDO O MESMO IP
      // POR ISSO USA-SE 127.0.0.1, POREM SE FOR USAR UM CELULAR MESMO NA MESMA
      // REDE, DEVE-SE APONTAR PRO IP LOCAL ONDE ESTA O BANCO, ENTENDEU?OK

      // ANTES ESTAVA DANDO ERRO PQ O PHPMYADMIN ESTAVA USANDO A MESMA PORTA
      // Q SUA APLICACAO, AGORA ESTA DANDO ERRO DE PERMISSAO ESTOU TENTANDO HABILITAR
      user = 'root',
      password = 'root',
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

    return await MySqlConnection.connect(settings);
  }
}
