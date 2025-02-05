import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String? prefixText;
  final String? suffixText;
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final double? height;
  final double? width;
  final Color fillcolor;
  final String hintText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final bool enabled;
  final double borderRaduis;

  DefaultTextFormField({
    Key? key,
    this.prefixText,
    this.controller,
    this.textDirection,
    this.suffixText,
    this.height,
    this.width,
    this.onChanged,
    this.fillcolor = Colors.white,
    this.hintText = '',
    this.textAlign, this.onTap, required this.enabled, this.prefixIcon,  this.borderRaduis=6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        enabled: enabled,
        onChanged: onChanged,
        textDirection: textDirection,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixText: prefixText,
          suffixText: suffixText,
          fillColor: fillcolor,
          prefixIcon: prefixIcon,
          filled: true,
          suffixStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          prefixStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide(
                color: Colors.grey
                    .withOpacity(0.7)), // Changed to grey color
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide(
                color: Colors.grey.shade200), // Changed to grey color
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.2)), // Changed to grey color
          ),
        ),
      ),
    );
  }
}
