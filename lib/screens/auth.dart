import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  shadowLightColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade300
                          : Colors.grey.shade600,
                  shadowDarkColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade700
                          : Colors.black,
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(32)),
                                depth: -4,
                                lightSource: LightSource.topLeft,
                                color:
                                    const Color.fromARGB(176, 211, 211, 211)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(32)),
                                depth: -8,
                                lightSource: LightSource.topLeft,
                                color:
                                    const Color.fromARGB(176, 211, 211, 211)),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
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
      ),
    );
  }
}
