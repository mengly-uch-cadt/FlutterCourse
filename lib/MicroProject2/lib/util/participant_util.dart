import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/participant.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

// Function to hash a password
String hashPassword(String password) {
  final bytes = utf8.encode(password); // Convert password to bytes
  final digest = sha256.convert(bytes); // Hash the bytes using SHA-256
  return digest.toString(); // Convert the digest to a string
}

// Save the Participant to the database
Future<Participant> saveParticipant(MySqlConnection connection, Participant participant) async {
  await connection.query(
    'INSERT INTO participants (participant_id, first_name, last_name, phone_number, password) VALUES (?, ?, ?, ?, ?)',
    [participant.participantId, participant.firstName, participant.lastName, participant.phoneNumber, participant.hashedPassword],
  );
  return participant;
}

// Retrieve all participants from the database
Future<List<Participant>> getAllParticipants(MySqlConnection connection) async {
  List<Participant> participants = [];
  final results = await connection.query('SELECT * FROM participants');
  for (var row in results) {
    participants.add(Participant.fromDatabase(row.fields));
  }
  return participants;
}


// Function to authenticate a participant
Future<Participant?> loginParticipant(
  MySqlConnection connection,
  String phoneNumber,
  String password,
) async {
  // Hash the provided password
  final hashedPassword = hashPassword(password);

  // Query the database for a participant with the provided phone number and hashed password
  final results = await connection.query(
    'SELECT * FROM participants WHERE phone_number = ? AND password = ?',
    [phoneNumber, hashedPassword],
  );

  if (results.isNotEmpty) {
    // If a match is found, return the Participant object
    return Participant.fromDatabase(results.first.fields);
  } else {
    // Return null if no match is found
    return null;
  }
}