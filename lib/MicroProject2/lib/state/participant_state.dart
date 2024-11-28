import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/MicroProject2/lib/model/participant.dart';

class ParticipantNotifier extends StateNotifier<Participant?> {
  ParticipantNotifier() : super(null);

  // Add a participant to the state
  void addParticipant(Participant participant) {
    state = participant; // Set the participant as the new state
  }

  // Clear the participant state
  void clearParticipant() {
    state = null;
  }
}

// Create a Riverpod provider
final participantProvider = StateNotifierProvider<ParticipantNotifier, Participant?>(
        (ref) => ParticipantNotifier());
