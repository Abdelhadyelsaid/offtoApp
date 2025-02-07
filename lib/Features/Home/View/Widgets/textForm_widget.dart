import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final double? height;
  final double? width;
  final Color fillcolor;
  final String hintText;
  final String labelText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final bool enabled;
  final double borderRaduis;

  DefaultTextFormField({
    Key? key,
    this.controller,
    this.height,
    this.width,
    this.onChanged,
    this.fillcolor = Colors.white,
    this.hintText = '',
    this.textAlign,
    this.onTap,
    required this.enabled,
    this.prefixIcon,
    this.borderRaduis = 6,
    this.labelText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        enabled: enabled,
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          hintText: hintText,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          fillColor: fillcolor,
          prefixIcon: prefixIcon,
          filled: true,
          suffixStyle:  TextStyle(color: Colors.grey, fontSize: 16.sp),
          prefixStyle:  TextStyle(color: Colors.grey, fontSize: 16.sp),
          hintStyle: TextStyle(
              color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.bold),
          labelStyle: TextStyle(
            fontSize: 16.sp, // Adjust label font size
            color: Colors.black, // Adjust label color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.7)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRaduis),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
          ),
        ),
      ),
    );
  }
}
