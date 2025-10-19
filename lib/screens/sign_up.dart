import 'package:dart_chat/Widgets/neumorphic_card.dart';
import 'package:dart_chat/Widgets/neumorphic_text_form_field.dart';
import 'package:dart_chat/providers/auth_form_validator_provider.dart';
import 'package:dart_chat/utils/auth_form_validator.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  // final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _submit() async {
    final AuthFormValidator authFormValidator = ref.read(
      authFormValidatorProvider,
    );

    setState(() {
      print('test');
      _emailError = authFormValidator.validateEmail(_emailController.text);
      _passwordError = authFormValidator.validatePassword(
        _passwordController.text,
      );
    });
  }

  // void temp() async {
  //   final userID = await ref
  //       .read(authRepositoryProvider)
  //       .registerWithEmail(email, password);

  //   if (userID == null) {
  //     return;
  //   }

  //   Navigator.of(ctx).pushReplacement(
  //     MaterialPageRoute(builder: (_) => Profile(userID: userID)),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
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
                      label: 'E-Mail',
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                    ),
                    if (_emailError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          _emailError!,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    NeumorphicTextFormField(
                      label: 'Password',
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      obscureText: true,
                    ),
                    if (_passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          _passwordError!,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
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
                  print(_emailController.text);
                  _submit();
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


// class SignUpScreen extends ConsumerWidget {
//   SignUpScreen({super.key});

//   final emailTextFieldId = UuidGenerator.newID();
//   final passwordTextFieldId = UuidGenerator.newID();

//   void _submit(BuildContext ctx, WidgetRef ref) async {
//     final emailState = ref.read(textFieldStateProvider(emailTextFieldId));
//     final passwordState = ref.read(textFieldStateProvider(passwordTextFieldId));

//     if (emailState.error != null ||
//         passwordState.error != null ||
//         emailState.text == null ||
//         passwordState.text == null) {
//       print(emailState.error);
//       print(passwordState.error);
//       print(emailState.text);
//       print(passwordState.text);
//       return;
//     }

//     test(ctx, ref, emailState.text!, passwordState.text!);
//   }

//   void test(
//     BuildContext ctx,
//     WidgetRef ref,
//     String email,
//     String password,
//   ) async {
//     final userID = await ref
//         .read(authRepositoryProvider)
//         .registerWithEmail(email, password);

//     if (userID == null || !ctx.mounted) {
//       return;
//     }

//     Navigator.of(ctx).pushReplacement(
//       MaterialPageRoute(builder: (_) => Profile(userID: userID)),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authFormValidator = ref.read(authFormValidatorProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             SizedBox(width: 80, child: Image.asset('assets/images/logo.png')),
//             Text(
//               'DartChat',
//               style: Theme.of(
//                 context,
//               ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Create Your Account',
//               style: GoogleFonts.cookie(fontSize: 50),
//             ),
//             NeumorphicCard(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   spacing: 15,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     NeumorphicTextFormField(
//                       id: emailTextFieldId,
//                       label: 'E-Mail',
//                       keyboardType: TextInputType.emailAddress,
//                       autocorrect: false,
//                       textCapitalization: TextCapitalization.none,
//                       onEditingComplete: (email) {
//                         if (email == null) return;
//                         authFormValidator.validateEmail(
//                           email,
//                           emailTextFieldId,
//                         );
//                       },
//                     ),
//                     NeumorphicTextFormField(
//                       id: passwordTextFieldId,
//                       label: 'Password',
//                       autocorrect: false,
//                       textCapitalization: TextCapitalization.none,
//                       obscureText: true,
//                       onEditingComplete: (password) {
//                         if (password == null) return;
//                         authFormValidator.validatePassword(
//                           password,
//                           passwordTextFieldId,
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 50),
//             SizedBox(
//               height: 50,
//               width: 408,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.grey.shade100,
//                 ),
//                 onPressed: () {
//                   print('reached button');
//                   _submit(context, ref);
//                 },
//                 child: const Text('Sign up'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class CreateAccountScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   CreateAccountScreen({super.key});

//   // ... (restliche State/Widget Struktur)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey, // Der Schlüssel, um das Formular zu steuern
//         child: Column(
//           children: [
//             // E-Mail Feld
//             NeumorphicFormInput(
//               controller: _emailController,
//               hintText: 'E-Mail',
//               keyboardType: TextInputType.emailAddress,
//               validator: (value) {
//                 // Hier definierst du die Logik
//                 if (value == null || !value.contains('@')) {
//                   return 'Bitte gültige E-Mail eingeben';
//                 }
//                 return null; // Alles OK
//               },
//             ),
//             const SizedBox(height: 20),
//             // Passwort Feld
//             NeumorphicFormInput(
//               controller: _passwordController,
//               hintText: 'Password',
//               obscureText: true,
//               validator: (value) {
//                 if (value == null || value.length < 6) {
//                   return 'Passwort muss min. 6 Zeichen haben';
//                 }
//                 return null;
//               },
//             ),

//             // "Sign up" Button
//             ElevatedButton(
//               onPressed: () {
//                 // Bei Klick auf den Button: Das Formular validieren!
//                 if (_formKey.currentState!.validate()) {
//                   // Wenn valid (true): Daten senden
//                   print('E-Mail: ${_emailController.text}');
//                   print('Passwort: ${_passwordController.text}');
//                   // Hier kommt deine Firebase-Logik
//                 }
//               },
//               child: const Text('Sign up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
