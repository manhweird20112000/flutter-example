import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Field extends StatefulWidget {
  final String placeholder;
  final String label;
  final bool isPassword;
  final String icon;
  final TextEditingController controller;
  const Field(
      {super.key,
      this.placeholder = '',
      this.label = '',
      this.isPassword = false,
      required this.icon,
      required this.controller});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              fontFamily: 'Urbanist'),
        ),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              isFocused = hasFocus;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: isFocused
                    ? const [
                        BoxShadow(
                            color: Color(0xFF9BB168),
                            blurRadius: 4,
                            offset: Offset(0, 0))
                      ]
                    : null),
            child: TextFormField(
              controller: widget.controller,
              autofocus: false,
              obscureText: widget.isPassword,
              enableSuggestions: false,
              autocorrect: false,
              cursorColor: const Color(0xFF9BB168),
              decoration: InputDecoration(
                prefixIcon: UnconstrainedBox(
                  child: SvgPicture.asset(
                    widget.icon,
                    width: 24,
                    height: 24,
                  ),
                ),
                suffixIcon: widget.isPassword
                    ? UnconstrainedBox(
                        child: SvgPicture.asset(
                          'assets/icons/eye.svg',
                          width: 24,
                          height: 24,
                        ),
                      )
                    : null,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: const BorderSide(
                    color: Color(0xFF9BB168),
                  ),
                ),
                hintText: widget.placeholder,
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 1,
              style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF736B66)),
            ),
          ),
        ),
      ],
    );
  }
}
