import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../Core/Const/colors.dart';
import '../../../../generated/l10n.dart';
import '../../Bloc/home_cubit.dart';

Widget buildMonthCalendar(
    BuildContext context, DateTime month, HomeCubit cubit) {
  var tr = S.of(context);
  final now = DateTime.now();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          DateFormat('MMMM yyyy').format(month),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(tr.Sun),
          Text(tr.Mon),
          Text(tr.Tue),
          Text(tr.Wed),
          Text(tr.Thu),
          Text(tr.Fri),
          Text(tr.Sat),
        ],
      ),
      const SizedBox(height: 4),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
        ),
        itemCount: cubit.daysInMonth(month) + cubit.firstDayOfMonth(month).weekday,
        itemBuilder: (context, index) {
          if (index < cubit.firstDayOfMonth(month).weekday) {
            return const SizedBox.shrink();
          }
          DateTime day = DateTime(month.year, month.month,
              index - cubit.firstDayOfMonth(month).weekday + 1);
          bool isSelectable =
          day.isAfter(now.subtract(const Duration(days: 1)));
          bool isSelectedDepart = cubit.departController.text.isNotEmpty &&
              cubit.isSameDay(
                  day,
                  DateFormat('dd MMM. yy')
                      .parse(cubit.departController.text));
          bool isSelectedArrive = cubit.arriveController.text.isNotEmpty &&
              cubit.isSameDay(
                  day,
                  DateFormat('dd MMM. yy')
                      .parse(cubit.arriveController.text));
          bool isBetween = cubit.departController.text.isNotEmpty &&
              cubit.arriveController.text.isNotEmpty &&
              day.isAfter(DateFormat('dd MMM. yy')
                  .parse(cubit.departController.text)) &&
              day.isBefore(DateFormat('dd MMM. yy')
                  .parse(cubit.arriveController.text));

          return GestureDetector(
            onTap: isSelectable
                ? () {
              if (cubit.departController.text.isEmpty ||
                  cubit.arriveController.text.isNotEmpty) {
                cubit.setTravelDate(
                    '', DateFormat('dd MMM. yy').format(day));
              } else if (day.isAfter(DateFormat('dd MMM. yy')
                  .parse(cubit.departController.text))) {
                cubit.setTravelDate(
                    DateFormat('dd MMM. yy').format(day),
                    cubit.departController.text);
              } else {
                cubit.setTravelDate(
                    '', DateFormat('dd MMM. yy').format(day));
              }
            }
                : null,
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: isSelectedDepart || isSelectedArrive
                    ? selectedColor
                    : isBetween
                    ? highlightedColor
                    : regularColor,
                borderRadius: BorderRadius.circular(5),
                border: cubit.isSameDay(day, now)
                    ? Border.all(color: selectedColor, width: 1.5)
                    : null,
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: isBetween || cubit.isSameDay(day, now)
                        ? selectedColor
                        : isSelectedDepart || isSelectedArrive
                        ? Colors.white
                        : isSelectable
                        ? Colors.black
                        : Colors.grey,
                    fontWeight: cubit.isSameDay(day, now)
                        ? FontWeight.bold
                        : FontWeight.normal,
                    decoration: !isSelectable
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}