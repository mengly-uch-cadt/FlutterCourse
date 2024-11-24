import 'package:mysql1/mysql1.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Participant {
  static const Uuid uuid = Uuid();
  final String participantId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  late final String hashedPassword;

  Participant(this.firstName, this.lastName, this.phoneNumber, String password)
      : participantId = Participant.uuid.v4() {
    hashedPassword = _hashPassword(password);
  }

  // Hash the password
  static String _hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to bytes
    final digest = sha256.convert(bytes); // Hash the bytes using SHA-256
    return digest.toString(); // Convert the digest to a string
  }

  // Save the Participant to the database
  Future<void> saveToDatabase(MySqlConnection connection) async {
    await connection.query(
      'INSERT INTO participants (participant_id, first_name, last_name, phone_number, password) VALUES (?, ?, ?, ?, ?)',
      [participantId, firstName, lastName, phoneNumber, hashedPassword],
    );
  }
}
