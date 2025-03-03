import 'package:dart_chat/Widgets/neumorphic_card.dart';
import 'package:dart_chat/Widgets/neumorphic_text_form_field.dart';
import 'package:dart_chat/providers/repository_providers/auth_repository_provider.dart';
import 'package:dart_chat/providers/text_field_error_provider.dart';
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
    final emailState =
        ref.read(textFieldStateNotifierProvider(emailTextFieldId));
    final passwordState =
        ref.read(textFieldStateNotifierProvider(passwordTextFieldId));

    if (emailState.error != null ||
        passwordState.error != null ||
        emailState.text == null ||
        passwordState.text == null) {
      return;
    }

    final userID = await ref
        .read(authRepositoryProvider)
        .register(emailState.text!, passwordState.text!);

    if (userID == null || !ctx.mounted) {
      return;
    }

    Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (_) => Profile(userID: userID)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            NeumorphicCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 15,
                  children: [
                    NeumorphicTextFormField(
                      label: 'E-Mail',
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                    ),
                    NeumorphicTextFormField(
                      label: 'Password',
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                onPressed: () => _submit(context, ref),
                child: const Text('Sign up'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
