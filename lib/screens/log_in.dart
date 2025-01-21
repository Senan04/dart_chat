import 'package:dart_chat/Widgets/neumorphic_card.dart';
import 'package:dart_chat/Widgets/neumorphic_text_form_field.dart';
import 'package:dart_chat/providers/repository_providers/auth_repository_provider.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:dart_chat/screens/sign_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  var _enteredEmail = '';
  var _enteredPassword = '';

  var _emailValid = true;
  var _passwordValid = true;

  var _emailError = '';
  var _passwordError = '';

  void _submit() async {
    final authRepository = ref.watch(authRepositoryProvider);

    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    authRepository.login(_enteredEmail, _enteredPassword);
  }

  void _showEmailError(bool show, {String message = ''}) {
    if (!show) {
      setState(() {
        _emailValid = true;
      });
      return;
    }

    _emailError = message;
    setState(() {
      _emailValid = false;
    });
  }

  void _showPasswordError(bool show, {String message = ''}) {
    if (!show) {
      setState(() {
        _passwordValid = true;
      });
      return;
    }

    _passwordError = message;
    setState(() {
      _passwordValid = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                width: 300,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.6,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              const Text(
                'DartChat',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              NeumorphicCard(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          NeumorphicTextFormField(
                            label: 'E-Mail',
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                          if (!_emailValid)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, top: 5.0),
                              child: Text(
                                _emailError,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                              ),
                            ),
                          const SizedBox(
                            height: 15,
                          ),
                          NeumorphicTextFormField(
                            label: 'Password',
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            obscureText: true,
                          ),
                          if (!_passwordValid)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, top: 5.0),
                              child: Text(
                                _passwordError,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error),
                              ),
                            ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 408,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade100,
                  ),
                  onPressed: _submit,
                  child: const Text('Log In'),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 300,
                height: 50,
                child: Placeholder(),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 300,
                height: 50,
                child: Placeholder(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const SignUpScreen())),
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
