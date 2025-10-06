import 'package:dart_chat/Widgets/neumorphic_card.dart';
import 'package:dart_chat/Widgets/neumorphic_text_form_field.dart';
import 'package:dart_chat/providers/auth_form_validator_provider.dart';
import 'package:dart_chat/providers/repository_providers/auth_repository_provider.dart';
import 'package:dart_chat/providers/text_field_state_provider.dart';
import 'package:dart_chat/screens/profile.dart';
import 'package:dart_chat/utils/uuid_generator.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final emailTextFieldId = UuidGenerator.newID();
  final passwordTextFieldId = UuidGenerator.newID();

  void _submit(BuildContext ctx, WidgetRef ref) async {
    final emailState = ref.read(textFieldStateProvider(emailTextFieldId));
    final passwordState = ref.read(textFieldStateProvider(passwordTextFieldId));

    if (emailState.error != null ||
        passwordState.error != null ||
        emailState.text == null ||
        passwordState.text == null) {
      print(emailState.error);
      print(passwordState.error);
      print(emailState.text);
      print(passwordState.text);
      return;
    }

    test(ctx, ref, emailState.text!, passwordState.text!);
  }

  void test(
    BuildContext ctx,
    WidgetRef ref,
    String email,
    String password,
  ) async {
    final userID = await ref
        .read(authRepositoryProvider)
        .registerWithEmail(email, password);

    if (userID == null || !ctx.mounted) {
      return;
    }

    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (_) => Profile(userID: userID)),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authFormValidator = ref.read(authFormValidatorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 80, child: Image.asset('assets/images/logo.png')),
            Text(
              'DartChat',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
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
                          email,
                          emailTextFieldId,
                        );
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
                          password,
                          passwordTextFieldId,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
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
                onPressed: () {
                  print('reached button');
                  _submit(context, ref);
                },
                child: const Text('Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
