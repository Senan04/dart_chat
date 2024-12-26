import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _enteredEmail = '';
  var _enteredPassword = '';

  var _emailValid = true;
  var _passwordValid = true;

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
                                setState(() {
                                  _emailValid = false;
                                });
                                return null;
                              }
                              setState(() {
                                _emailValid = true;
                              });
                              return null;
                            },
                            onSaved: (newValue) => _enteredEmail = newValue!,
                          ),
                        ),
                        if (!_emailValid)
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                            child: Text(
                              'Please enter a valid email adress.',
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
                                setState(() {
                                  _passwordValid = false;
                                });
                                return null;
                              }
                              setState(() {
                                _passwordValid = true;
                              });
                              return null;
                            },
                            onSaved: (newValue) => _enteredPassword = newValue!,
                          ),
                        ),
                        if (!_passwordValid)
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                            child: Text(
                              'Password must be at least 6 characters long.',
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
          ],
        ),
      ),
    );
  }
}
