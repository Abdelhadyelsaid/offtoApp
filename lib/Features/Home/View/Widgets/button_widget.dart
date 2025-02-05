import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final double? width;
  final Color color;
  final String text;
  final double? textSize;
  final  FontWeight? fontWeight;
  final BorderRadiusGeometry? borderRadius;
  void Function()? onTap;
  DefaultButton({super.key , required this.height , required this.color , required this.text ,  this.onTap,  this.width, this.borderRadius, this.textSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ,
        ) ,
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize:textSize, fontWeight:fontWeight ?? FontWeight.w700) ,)),),
    );
  }
}
