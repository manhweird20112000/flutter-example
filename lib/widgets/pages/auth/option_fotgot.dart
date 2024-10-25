import 'package:flutter/material.dart';

class OptionForgot extends StatelessWidget {
  final String text;
  final Widget icon;
  final bool isChoose;
  final VoidCallback onPressed;
  const OptionForgot(
      {super.key,
      required this.text,
      required this.icon,
      this.isChoose = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 116,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(200),
            border: Border.all(
                color: isChoose ? const Color(0xFF9BB168) : Colors.transparent),
            boxShadow: [
              BoxShadow(
                  color: isChoose
                      ? const Color(0xFF9BB168)
                      : const Color(0xFF4b3425).withAlpha(20),
                  blurRadius: isChoose ? 10 : 15,
                  blurStyle: isChoose ? BlurStyle.solid : BlurStyle.normal,
                  offset: isChoose ? const Offset(0, 0) : const Offset(12, 6))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 12,
              ),
              Text(
                text,
                style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
