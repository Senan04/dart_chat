import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicCard extends StatelessWidget {
  final Widget child;

  const NeumorphicCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
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
        child: child,
      ),
    );
  }
}
