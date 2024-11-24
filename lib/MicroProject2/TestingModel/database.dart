import 'package:mysql1/mysql1.dart';

class Database {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
      host: '127.0.0.1', // Use explicit IP for XAMPP
      port: 3306,
      user: 'root',
      // password: '', // Use the exact password (or leave blank if none)
      db: 'quiz_app',
    );
    return await MySqlConnection.connect(settings);
  }
}
