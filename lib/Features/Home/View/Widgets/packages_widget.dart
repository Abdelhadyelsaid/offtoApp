import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Const/colors.dart';

class PackagesWidget extends StatelessWidget {
  const PackagesWidget(
      {super.key, required this.text, required this.assetPath, this.onTap});

  final String text;
  final String assetPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: .42.sw,
        decoration: BoxDecoration(
          color: iconBackColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                child: Image.asset(assetPath, width: 24),
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
