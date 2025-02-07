import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offto/Core/Const/colors.dart';
import 'package:offto/Features/Home/View/Widgets/button_widget.dart';
import 'package:offto/Features/Home/View/Widgets/textForm_widget.dart';
import '../../../../generated/l10n.dart';
import '../../Bloc/home_cubit.dart';
import 'calenderWidget.dart';

class DatePickerBottomSheet extends StatelessWidget {


  const DatePickerBottomSheet({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        final now = DateTime.now();
        final endDate = DateTime.now().add(const Duration(days: 365 * 2));
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50.w,
                height: 8.h,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr.travelDates,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: locationColor),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: closeColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DefaultTextFormField(
                      labelText: tr.depart,
                      controller: cubit.departController,
                      enabled: false,
                      hintText: tr.departDate,
                      prefixIcon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      fillcolor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DefaultTextFormField(
                      labelText: tr.return_text,
                      controller: cubit.arriveController,
                      enabled: false,
                      hintText: tr.returnDate,
                      prefixIcon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                      fillcolor: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.calculateMonthCount(now, endDate),
                  itemBuilder: (context, index) {
                    DateTime month = DateTime(now.year, now.month + index);
                    return buildMonthCalendar(context, month, cubit);
                  },
                ),
              ),
              Container(
                height: .08.h,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              DefaultButton(
                textSize: 20,
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.pop(context);
                },
                height: 55.h,
                color: cubit.departController.text.isEmpty ||
                        cubit.arriveController.text.isEmpty
                    ? Colors.grey
                    : locationColor,
                text: tr.confirm,
              ),
            ],
          ),
        );
      },
    );
  }

}
