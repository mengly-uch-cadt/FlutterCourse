// import 'package:mysql1/mysql1.dart';
// import 'package:uuid/uuid.dart';
// import 'dart:convert';
// import 'package:crypto/crypto.dart';

// class Participant {
//   static const Uuid uuid = Uuid();
//   final String participantId;
//   final String firstName;
//   final String lastName;
//   final String phoneNumber;
//   late final String hashedPassword;

//   Participant(this.firstName, this.lastName, this.phoneNumber, String password)
//       : participantId = Participant.uuid.v4() {
//     hashedPassword = _hashPassword(password);
//   }

//   // Hash the password
//   static String _hashPassword(String password) {
//     final bytes = utf8.encode(password); // Convert password to bytes
//     final digest = sha256.convert(bytes); // Hash the bytes using SHA-256
//     return digest.toString(); // Convert the digest to a string
//   }

//   // Save the Participant to the database
//   Future<void> saveToDatabase(MySqlConnection connection) async {
//     await connection.query(
//       'INSERT INTO participants (participant_id, first_name, last_name, phone_number, password) VALUES (?, ?, ?, ?, ?)',
//       [participantId, firstName, lastName, phoneNumber, hashedPassword],
//     );
//   }

//   Future<List<Participant>> getAllParticipants(MySqlConnection connection) async {
//     List<Participant> participants = [];
//     final results = await connection.query('SELECT * FROM participants');
//     for (var row in results) {
//       participants.add(
//         Participant(
//           row['first_name'], 
//           row['last_name'], 
//           row['phone_number'], 
//           row['password']
//         )
//       );
//     } 

//     return participants;
//   }
// }

import 'package:uuid/uuid.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Participant {
  static const Uuid uuid = Uuid();
  final String participantId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  late final String hashedPassword;

  // Constructor for creating a new participant
  Participant(this.firstName, this.lastName, this.phoneNumber, String password)
      : participantId = Participant.uuid.v4() {
    hashedPassword = _hashPassword(password);
  }

  // Named constructor for initializing from database row
  Participant.fromDatabase(Map<String, dynamic> row)
      : participantId = row['participant_id'],
        firstName = row['first_name'],
        lastName = row['last_name'],
        phoneNumber = row['phone_number'],
        hashedPassword = row['password'];

  // Hash the password
  static String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Save the Participant to the database
  Future<void> saveToDatabase(MySqlConnection connection) async {
    await connection.query(
      'INSERT INTO participants (participant_id, first_name, last_name, phone_number, password) VALUES (?, ?, ?, ?, ?)',
      [participantId, firstName, lastName, phoneNumber, hashedPassword],
    );
  }

  // Retrieve all participants from the database
  static Future<List<Participant>> getAllParticipants(MySqlConnection connection) async {
    List<Participant> participants = [];
    final results = await connection.query('SELECT * FROM participants');
    for (var row in results) {
      participants.add(Participant.fromDatabase(row.fields));
    }
    return participants;
  }
}
