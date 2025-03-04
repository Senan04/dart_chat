import 'package:dart_chat/providers/text_field_error_provider.dart';
import 'package:dart_chat/utils/uuid_generator.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NeumorphicTextFormField extends ConsumerWidget {
  final String? label;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String?)? onSubmitted;
  final String id;

  NeumorphicTextFormField({
    super.key,
    this.label,
    this.autocorrect = true,
    this.obscureText = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.onSubmitted,
    String? id,
  }) : id = id ?? UuidGenerator.newID();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textFieldState = ref.watch(textFieldStateNotifierProvider(id));

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
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.circular(32),
            ),
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
            autocorrect: autocorrect,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            onSubmitted: onSubmitted,
          ),
        ),
        if (textFieldState.error != null)
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 10.0),
            child: Text(
              textFieldState.error!,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Theme.of(context).colorScheme.error),
            ),
          ),
      ],
    );
  }
}
