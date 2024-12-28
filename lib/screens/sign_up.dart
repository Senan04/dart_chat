import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dart_chat/screens/profile.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);

      if (context.mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => Profile(userCredentials: userCredentials)));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use' || e.code == 'invalid-email') {
        _showEmailError(true, message: 'Please try another email adress.');
      } else if (e.code == 'weak-password') {
        _showPasswordError(true, message: 'Please try a stronger password.');
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
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 80,
              child: Image.asset('assets/images/logo.png'),
            ),
            Text(
              'DartChat',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create Your Account',
              style: GoogleFonts.cookie(fontSize: 50),
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
                            onSaved: (newValue) => _enteredEmail = newValue!,
                          ),
                        ),
                        if (!_emailValid)
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                            child: Text(
                              _emailError,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      color:
                                          Theme.of(context).colorScheme.error),
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
                              if (value == null || value.trim().length < 6) {
                                _showPasswordError(true,
                                    message:
                                        'Password must be at least 6 characters long.');
                                return null;
                              }
                              _showPasswordError(false);
                              return null;
                            },
                            onSaved: (newValue) => _enteredPassword = newValue!,
                          ),
                        ),
                        if (!_passwordValid)
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                            child: Text(
                              _passwordError,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      color:
                                          Theme.of(context).colorScheme.error),
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
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 408,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                ),
                onPressed: _submit,
                child: const Text('Sign up'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
