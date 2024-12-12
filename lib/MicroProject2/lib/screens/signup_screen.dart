import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/model/participant.dart';
import 'package:practice/MicroProject2/lib/database/database.dart';
import 'package:practice/MicroProject2/lib/state/participant_state.dart';
import 'package:practice/MicroProject2/lib/util/participant_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Add this import
import 'package:practice/MicroProject2/lib/widgets/quiz_button.dart';
import 'package:practice/MicroProject2/lib/widgets/quiz_password_field.dart';
import 'package:practice/MicroProject2/lib/widgets/quiz_text_form_field.dart';
Color appColor = Colors.blue[500] as Color;

class SignupScreen extends ConsumerStatefulWidget {

  final VoidCallback onSignupSuccess;
  final VoidCallback onLogin;

  const SignupScreen({super.key, required this.onSignupSuccess, required this.onLogin});

  @override
  ConsumerState<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<SignupScreen> {
  // final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  MySqlConnection? connection;

  // Initialize the connection asynchronously
  Future<void> _initializeDatabase() async {
    connection = await Database.connect();
  }

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
      ),
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 25),
                  QuizTextFormField(
                    controller: _firstNameController,
                    labelText: 'First Name',
                    hintText: "Enter your first name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                      }
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Please enter a valid first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  QuizTextFormField(
                    controller: _lastNameController,
                    labelText: 'Last Name',
                    hintText: "Enter your last name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                      }
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Please enter a valid first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  QuizTextFormField(
                    controller: _phoneController,
                    labelText: 'Phone number',
                    hintText: "Enter your phone number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.length < 9 || value.length > 10) {
                        return 'Please enter a valid phone number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  QuizPasswordFormField(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    isPasswordField: true, // Indicating it's a password field
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if (value.length > 20) {
                        return 'Password must not exceed 20 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  QuizButton(
                    text: "Sign Up",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final Participant participant = Participant(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          phoneNumber: _phoneController.text,
                          password: _passwordController.text,
                        );
                        if (connection == null) {
                          await _initializeDatabase();
                        }
                        // Proceed only if connection is ready
                        if (connection != null) {
                          final response = await saveParticipant(connection!, participant);
                          // ignore: unnecessary_null_comparison
                          if (response != null) {
                            final Participant participant = response;
                            ref.read(participantProvider.notifier).addParticipant(participant);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Sign up successful')),
                            );
                            widget.onSignupSuccess();
                            // go to home screen
                          } else {
                            // If sign up fails, show an error message
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Sign up failed')),
                            );
                          }

                        } else {
                          // If login fails, show an error message
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Invalid phone number or password')),
                          );
                        }
                      } else {
                        // Show an error or leave it to validators to handle
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please fix the errors in the form')),
                        );
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: widget.onLogin,
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
