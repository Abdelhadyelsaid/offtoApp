import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offto/Core/Const/colors.dart';
import 'package:offto/Features/Home/View/Widgets/button_widget.dart';
import '../../../../generated/l10n.dart';
import '../../Bloc/home_cubit.dart';
import 'generate_rooms_widget.dart';

class GuestsBottomSheet extends StatelessWidget {
  const GuestsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr.passengers_rooms,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.grey),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cubit.rooms.length,
                  itemBuilder: (context, index) {
                    return buildRoom(context, index);
                  },
                ),
                SizedBox(height: 10.h),
                if (cubit.rooms.length < 4)
                  InkWell(
                    onTap: () {
                      cubit.addRoom();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: locationColor,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          tr.addRoom,
                          style: TextStyle(color: locationColor),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 15.h),
                DefaultButton(
                  textSize: 20,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    final totalRooms = cubit.rooms.length;
                    final totalAdults =
                        cubit.rooms.fold(0, (sum, room) => sum + room.adults);
                    final totalChildren =
                        cubit.rooms.fold(0, (sum, room) => sum + room.children);
                    final totalInfants =
                        cubit.rooms.fold(0, (sum, room) => sum + room.infants);

                    final List<String> summaryParts = [];
                    if (totalRooms > 0) {
                      summaryParts.add("${totalRooms}x  ${tr.room}");
                    }
                    if (totalAdults > 0) {
                      summaryParts.add("$totalAdults ${tr.adult}");
                    }
                    if (totalChildren > 0) {
                      summaryParts.add("$totalChildren ${tr.child}");
                    }
                    if (totalInfants > 0) {
                      summaryParts.add("$totalInfants ${tr.infant}");
                    }
                    cubit.updateSummary(summaryParts.join(", "));
                    Navigator.pop(context);
                  },
                  height: 50.h,
                  color: buttonColor,
                  text: tr.done,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
