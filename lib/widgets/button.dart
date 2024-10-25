import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Button extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;

  const Button(
      {super.key,
      required this.text,
      required this.onPressed,
      this.icon = 'assets/icons/arrow-right.svg'});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            backgroundColor: const Color(0xFF4F3422)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Urbanist',
                  color: Colors.white),
            ),
            const SizedBox(
              width: 12,
            ),
            SvgPicture.asset(icon)
          ],
        ));
  }
}
