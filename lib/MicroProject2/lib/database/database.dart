import 'package:mysql1/mysql1.dart';

class Database {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
      host: 'sql12.freemysqlhosting.net', // Use explicit IP for XAMPP
      port: 3306,
      user: 'sql12747699',
      password: 'fYtJRCbrB8', // Use the exact password (or leave blank if none)
      db: 'sql12747699',
    );
    return await MySqlConnection.connect(settings);
  }
}
