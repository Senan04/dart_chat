import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NeumorphicTextFormField extends ConsumerWidget {
  final String? label;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  //final void Function(String?)? onEditingComplete;

  NeumorphicTextFormField({
    super.key,
    this.label,
    this.autocorrect = true,
    this.obscureText = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    // this.onEditingComplete,
    this.validator,
  });

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
            child: Text(
              label!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(32)),
            depth: -8,
            lightSource: LightSource.topLeft,
            color: Colors.grey.shade300,
          ),
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
            controller: _textEditingController,
            autocorrect: autocorrect,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
          ),
        ),
        // if (textFieldState.error != null)
        //   Padding(
        //     padding: const EdgeInsets.only(left: 5.0, top: 10.0),
        //     child: Text(
        //       textFieldState.error!,
        //       style: Theme.of(context).textTheme.bodyMedium!.apply(
        //         color: Theme.of(context).colorScheme.error,
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}


// import 'package:dart_chat/providers/text_field_state_provider.dart';
// import 'package:dart_chat/utils/uuid_generator.dart';
// import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class NeumorphicTextFormField extends ConsumerWidget {
//   final String? label;
//   final bool autocorrect;
//   final bool obscureText;
//   final TextInputType? keyboardType;
//   final TextCapitalization textCapitalization;
//   final void Function(String?)? onEditingComplete;
//   final String id;

//   NeumorphicTextFormField({
//     super.key,
//     this.label,
//     this.autocorrect = true,
//     this.obscureText = false,
//     this.keyboardType,
//     this.textCapitalization = TextCapitalization.none,
//     this.onEditingComplete,
//     String? id,
//   }) : id = id ?? UuidGenerator.newID();

//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final textFieldStateNotifier = ref.read(
//       textFieldStateProvider(id).notifier,
//     );
//     var textFieldState = ref.watch(textFieldStateProvider(id));

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (label != null)
//           Padding(
//             padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
//             child: Text(
//               label!,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         Neumorphic(
//           style: NeumorphicStyle(
//             shape: NeumorphicShape.flat,
//             boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(32)),
//             depth: -8,
//             lightSource: LightSource.topLeft,
//             color: Colors.grey.shade300,
//           ),
//           child: TextField(
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 12.0,
//               ),
//             ),
//             controller: _textEditingController,
//             autocorrect: autocorrect,
//             obscureText: obscureText,
//             keyboardType: keyboardType,
//             textCapitalization: textCapitalization,
//             onEditingComplete: () {
//               print(_textEditingController.text);
//               textFieldStateNotifier.setText(_textEditingController.text);
//               if (onEditingComplete != null) {
//                 onEditingComplete!(_textEditingController.text);
//               }
//             },
//           ),
//         ),
//         if (textFieldState.error != null)
//           Padding(
//             padding: const EdgeInsets.only(left: 5.0, top: 10.0),
//             child: Text(
//               textFieldState.error!,
//               style: Theme.of(context).textTheme.bodyMedium!.apply(
//                 color: Theme.of(context).colorScheme.error,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }


// class NeumorphicFormInput extends StatelessWidget {
//   final TextEditingController? controller;
//   final String hintText;
//   final bool obscureText;
//   final TextInputType? keyboardType;
//   // Wichtig: Der Validator, der in einem Form-Widget genutzt wird
//   final String? Function(String?)? validator;
//   final FocusNode? focusNode;

//   const NeumorphicFormInput({
//     super.key,
//     this.controller,
//     required this.hintText,
//     this.obscureText = false,
//     this.keyboardType,
//     this.validator,
//     this.focusNode,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // ----------------------------------------------------
//     // Der äußere Container mit deinem Neumorphic Design
//     // ----------------------------------------------------
//     return Container(
//       // Padding und Decoration wie in deinem Design-Bild
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE0E5EC), // Beispiel-Hintergrundfarbe
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           // Dein Schatten für den Neumorphismus (wie zuvor)
//           BoxShadow(
//             color: Color(0xFFA3B1C6),
//             offset: Offset(4, 4),
//             blurRadius: 15,
//             spreadRadius: 1,
//           ),
//           BoxShadow(
//             color: Colors.white,
//             offset: Offset(-4, -4),
//             blurRadius: 15,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       // ----------------------------------------------------
//       // Internes TextFormField
//       // ----------------------------------------------------
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         validator: validator, // Leite den Validator weiter!
//         focusNode: focusNode,
//         style: const TextStyle(color: Colors.black87), // Textstil
//         decoration: InputDecoration(
//           hintText: hintText,
//           // Unbedingt Standard-Dekorationen entfernen:
//           border: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none, // Wichtig für Fehleranzeige
//           // Die Fehler-Text-Anzeige wird vom FormField gehandhabt
//         ),
//       ),
//     );
//   }
// }
