import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dart_chat/utils/uuid_generator.dart';
import 'package:dart_chat/screens/sign_up.dart';
import 'package:dart_chat/Widgets/neumorphic_card.dart';
import 'package:dart_chat/Widgets/neumorphic_text_form_field.dart';
import 'package:dart_chat/providers/auth_form_validator_provider.dart';

class LogInScreen extends ConsumerWidget {
  LogInScreen({super.key});

  final emailTextFieldId = UuidGenerator.newID();
  final passwordTextFieldId = UuidGenerator.newID();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authFormValidator = ref.read(authFormValidatorProvider);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
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
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NeumorphicTextFormField(
                        id: emailTextFieldId,
                        label: 'E-Mail',
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        onEditingComplete: (email) {
                          if (email == null) return;
                          authFormValidator.validateEmail(
                              email, emailTextFieldId);
                        },
                      ),
                      NeumorphicTextFormField(
                        id: passwordTextFieldId,
                        label: 'Password',
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        obscureText: true,
                        onEditingComplete: (password) {
                          if (password == null) return;
                          authFormValidator.validatePassword(
                              password, passwordTextFieldId);
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              _loginButton,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _orDivider,
              ),
              const SizedBox(
                width: 300,
                height: 50,
                child: Placeholder(),
              ),
              const SizedBox(
                width: 300,
                height: 50,
                child: Placeholder(),
              ),
              _signUpLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _loginButton {
    return SizedBox(
      height: 50,
      width: 408,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade100,
        ),
        onPressed: () {},
        child: const Text('Log In'),
      ),
    );
  }

  Widget get _orDivider {
    return const Row(
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
    );
  }

  Widget _signUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => SignUpScreen())),
          child: const Text('Sign up'),
        ),
      ],
    );
  }
}
