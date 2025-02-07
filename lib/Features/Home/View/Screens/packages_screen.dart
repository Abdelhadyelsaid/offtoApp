import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offto/Core/Const/colors.dart';
import '../../../../generated/l10n.dart';
class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title:Text(tr.packagesPage) ,
      centerTitle: true,

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(tr.packagesPage,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp
            ),),
          )
        ],
      ),
    );
  }
}
