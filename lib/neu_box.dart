import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle, boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 15, offset: const Offset(5, 5)),
        const BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(-5, -5))
      ]),
      child: Center(child: child),
    );
  }
}

class NeuButton extends StatefulWidget {
  const NeuButton({super.key, required this.child});
  final Widget child;
  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE7ECEF);
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child: GestureDetector(
        onTap: () => setState(() {
          isPressed = !isPressed;
        }),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle, boxShadow: [
            BoxShadow(inset: isPressed, blurRadius: blur, offset: -distance, color: Colors.white),
            BoxShadow(
                inset: isPressed,
                blurRadius: blur,
                offset: distance,
                color: const Color(0xFFA7A9AF))
          ]),
          child: SizedBox(width: 100, height: 100, child: widget.child),
        ),
      )),
    );
  }
}
