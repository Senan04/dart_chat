import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:dart_chat/screens/sign_up.dart';

final _firebase = FirebaseAuth.instance;

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  var _enteredEmail = '';
  var _enteredPassword = '';

  var _emailValid = true;
  var _passwordValid = true;

  var _emailError = '';
  var _passwordError = '';

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    try {
      final userCredentials = await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email' || e.code == 'user-not-found') {
        _showEmailError(true, message: 'Please try another email adress.');
      } else if (e.code == 'wrong-password') {
        _showPasswordError(true, message: 'Wrong password.');
      } else {
        print(Text(e.message!));
      }
    }
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
              NeumorphicText(
                'DartChat',
                style: NeumorphicStyle(
                  depth: 4,
                  color: Colors.black,
                  shadowLightColor: Colors.grey.shade300,
                  shadowDarkColor: Colors.grey.shade700,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Neumorphic(
                margin: const EdgeInsets.all(20),
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(15.0),
                  ),
                  lightSource: LightSource.topLeft,
                  shape: NeumorphicShape.flat,
                  depth: 18,
                  color: Colors.grey.shade100,
                  shadowLightColor: Colors.white,
                  shadowDarkColor: Colors.grey.shade600,
                  intensity: 0.7,
                  border: const NeumorphicBorder.none(),
                ),
                child: Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.grey.shade200,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0, bottom: 2.0),
                              child: Text(
                                'E-Mail',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(32),
                                ),
                                depth: -8,
                                lightSource: LightSource.topLeft,
                                color: Colors.grey.shade300,
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@')) {
                                    _showEmailError(true,
                                        message:
                                            'Please enter a valid email adress.');
                                    return null;
                                  }
                                  _showEmailError(false);
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _enteredEmail = newValue!,
                              ),
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
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0, bottom: 2.0),
                              child: Text(
                                'Password',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Neumorphic(
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(32)),
                                depth: -8,
                                lightSource: LightSource.topLeft,
                                color: Colors.grey.shade300,
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ),
                                ),
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 6) {
                                    _showPasswordError(true,
                                        message:
                                            'Password must be at least 6 characters long.');
                                    return null;
                                  }
                                  _showPasswordError(false);
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _enteredPassword = newValue!,
                              ),
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
