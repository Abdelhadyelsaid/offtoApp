import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Const/colors.dart';
import '../../Bloc/home_cubit.dart';

Widget buildCounter(
  BuildContext context,
  String title,
  String subtitle,
  String type,
  int roomIndex,
) {
  return BlocBuilder<HomeCubit, HomeState>(
    builder: (context, state) {
      final cubit = context.read<HomeCubit>();
      final locale =
          Localizations.localeOf(context).languageCode; // Detect language
      int count;
      if (locale == "ar") {
        switch (type) {
          case 'بالغين':
            count = cubit.rooms[roomIndex].adults;
            break;
          case 'أطفال':
            count = cubit.rooms[roomIndex].children;
            break;
          case 'رضع':
            count = cubit.rooms[roomIndex].infants;
            break;
          default:
            count = 0;
        }
      } else {
        switch (type) {
          case 'Adults':
            count = cubit.rooms[roomIndex].adults;
            break;
          case 'Children':
            count = cubit.rooms[roomIndex].children;
            break;
          case 'Infants':
            count = cubit.rooms[roomIndex].infants;
            break;
          default:
            count = 0;
        }
      }

      return ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                color: minusColor,
              ),
              onPressed: () {
                if (locale == 'ar') {
                  if (count > 0) {
                    switch (type) {
                      case 'بالغين':
                        cubit.decrementAdult(roomIndex);
                        break;
                      case 'أطفال':
                        cubit.decrementChild(roomIndex);
                        break;
                      case 'رضع':
                        cubit.decrementInfant(roomIndex);
                        break;
                    }
                  }
                } else {
                  if (count > 0) {
                    switch (type) {
                      case 'Adults':
                        cubit.decrementAdult(roomIndex);
                        break;
                      case 'Children':
                        cubit.decrementChild(roomIndex);
                        break;
                      case 'Infants':
                        cubit.decrementInfant(roomIndex);
                        break;
                    }
                  }
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Text('$count'),
            ),
            IconButton(
              icon: Icon(
                Icons.add_circle_outline,
                color: locationColor,
              ),
              onPressed: () {
                if (locale == 'ar') {
                  if (count < 6) {
                    switch (type) {
                      case 'بالغين':
                        cubit.incrementAdult(roomIndex);
                        break;
                      case 'أطفال':
                        cubit.incrementChild(roomIndex);
                        break;
                      case 'رضع':
                        cubit.incrementInfant(roomIndex);
                        break;
                    }
                  }
                } else {
                  if (count < 6) {
                    switch (type) {
                      case 'Adults':
                        cubit.incrementAdult(roomIndex);
                        break;
                      case 'Children':
                        cubit.incrementChild(roomIndex);
                        break;
                      case 'Infants':
                        cubit.incrementInfant(roomIndex);
                        break;
                    }
                  }
                }
              },
            ),
          ],
        ),
      );
    },
  );
}
