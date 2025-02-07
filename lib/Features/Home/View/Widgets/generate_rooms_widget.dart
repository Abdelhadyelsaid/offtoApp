import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../generated/l10n.dart';
import '../../Bloc/home_cubit.dart';
import 'buildCounters_widget.dart';

Widget buildRoom(BuildContext context, int roomIndex) {
  final cubit = context.read<HomeCubit>();
  var tr = S.of(context);
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        border: Border.all(color: backColor),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              color: backColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${tr.room} (${roomIndex + 1})",
                  style: TextStyle(
                      color: locationColor, fontWeight: FontWeight.bold),
                ),
                if (roomIndex > 0) // Show close button from room 2 onward
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.grey),
                    onPressed: () {
                      cubit.removeRoom(
                          roomIndex); // Function to remove the room
                    },
                  ),
              ],
            ),
          ),
        ),
        buildCounter(
          context,
          tr.adult,
          tr.above,
          tr.adults,
          roomIndex,
        ),
        buildCounter(
          context,
          tr.child,
          tr.between,
          tr.children,
          roomIndex,
        ),
        buildCounter(
          context,
          tr.infant,
          tr.less,
          tr.infants,
          roomIndex,
        ),
      ],
    ),
  );
}