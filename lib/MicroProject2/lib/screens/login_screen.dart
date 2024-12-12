import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mysql1/mysql1.dart';
import 'package:practice/MicroProject2/lib/database/database.dart';
import 'package:practice/MicroProject2/lib/model/participant.dart';
import 'package:practice/MicroProject2/lib/state/participant_state.dart';
import 'package:practice/MicroProject2/lib/util/participant_util.dart';
import 'package:practice/MicroProject2/lib/widgets/quiz_button.dart';
import 'package:practice/MicroProject2/lib/widgets/quiz_password_field.dart';
import 'package:practice/MicroProject2/lib/widgets/quiz_text_form_field.dart';

Color appColor = Colors.blue[500] as Color;

class LoginScreen extends ConsumerStatefulWidget {
  final VoidCallback onLoginSuccess;
  final VoidCallback onSignUp;

  const LoginScreen({super.key, required this.onLoginSuccess, required this.onSignUp});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Make connection nullable to avoid LateInitializationError
  MySqlConnection? connection;

  // Initialize the connection asynchronously
  Future<void> _initializeDatabase() async {
    connection = await Database.connect();  // Connect to the database
  }

  @override
  void initState() {
    super.initState();
    _initializeDatabase(); 
  }

  @override
  void dispose() {
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
                    'Login',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 25),
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
                    isPasswordField: true, 
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
                    text: "Login",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final String phone = _phoneController.text;
                        final String password = _passwordController.text;
        
                        // Wait for connection initialization
                        if (connection == null) {
                          await _initializeDatabase(); // Ensure the connection is initialized
                        }
        
                        // Proceed only if connection is ready
                        if (connection != null) {
                          final response = await loginParticipant(connection!, phone, password);
                          if (response != null) {
        
                            final Participant participant = response;
                            // Correct method name
                            ref.read(participantProvider.notifier).addParticipant(participant);
        
                            // If login is successful, show a success message
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Login successful')),
                            );
                            widget.onLoginSuccess();
                          } else {
                            // If login fails, show an error message
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid phone number or password')),
                            );
                          }
                        } else {
                          // If connection is still null, show an error message
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Database connection failed')),
                          );
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: widget.onSignUp,
                        child: Text(
                          "Sign up",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, color: Colors.red),
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
