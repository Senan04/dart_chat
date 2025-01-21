import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicTextFormField extends StatelessWidget {
  final String? _label;
  final bool _autocorrect;
  final bool _obscureText;
  final TextInputType? _keyboardType;
  final TextCapitalization _textCapitalization;
  final void Function(String?)? _onSubmitted;

  const NeumorphicTextFormField({
    super.key,
    String? label,
    bool autocorrect = true,
    bool obscureText = false,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    void Function(String?)? onSubmitted,
  })  : _label = label,
        _autocorrect = autocorrect,
        _obscureText = obscureText,
        _textCapitalization = textCapitalization,
        _keyboardType = keyboardType,
        _onSubmitted = onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_label != null)
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
            child: Text(
              _label,
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
            autocorrect: _autocorrect,
            obscureText: _obscureText,
            keyboardType: _keyboardType,
            textCapitalization: _textCapitalization,
            onSubmitted: _onSubmitted,
          ),
        ),
      ],
    );
  }
}
