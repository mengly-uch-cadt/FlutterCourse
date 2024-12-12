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

  // Constructor for creating a new participant
  Participant({
    required this.firstName, 
    required this.lastName, 
    required this.phoneNumber, 
    required String password
  })  : participantId = uuid.v4(),
        hashedPassword = _hashPassword(password);

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

}
