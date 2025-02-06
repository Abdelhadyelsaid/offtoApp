import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:offto/Features/Home/Bloc/home_cubit.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Routing/routes.dart';
import '../../../../generated/l10n.dart';
import '../Widgets/button_widget.dart';
import '../Widgets/Selector_widget.dart';
import '../Widgets/city_search_widget.dart';
import '../Widgets/packages_widget.dart';
import '../Widgets/select_dates_widget.dart';
import '../Widgets/textForm_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Column(
              children: [
                SizedBox(
                  height: .1.sh,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PackagesWidget(
                      text: tr.flights,
                      assetPath: "assets/icons/airplane.png",
                      onTap: () {
                        context.pushNamed(Routes.flightsScreen.name);
                      },
                    ),
                    PackagesWidget(
                        text: tr.packages,
                        assetPath: "assets/icons/island.png",
                        onTap: () {
                          context.pushNamed(Routes.packagesScreen.name);
                        }),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  tr.searchTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SelectorWidget(
                  hintText: tr.to,
                  selectedText: cubit.toText, // Replace with your dynamic data
                  bottomSheet: BlocProvider.value(
                    value: cubit,
                    child: const FractionallySizedBox(
                      heightFactor: 0.85,
                      child: CitySearchBottomSheet(),
                    ),
                  ),
                  onFetchCities: () {
                    context.read<HomeCubit>().getCities(search: '');
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                SelectorWidget(
                  hintText: tr.selectDates,
                  selectedText: cubit.departController.text.isNotEmpty &&
                          cubit.arriveController.text.isNotEmpty
                      ? "${cubit.departController.text} ${tr.to} ${cubit.arriveController.text}"
                      : "",
                  bottomSheet: BlocProvider.value(
                    value: cubit,
                    child: FractionallySizedBox(
                      heightFactor: 0.85,
                      child: DatePickerBottomSheet(
                        onDatesSelected: (departDate, arriveDate) {
                          print('Depart: $departDate, Arrive: $arriveDate');
                        },
                      ),
                    ),
                  ),
                  onFetchCities: () {},
                ),
                SizedBox(
                  height: 15.h,
                ),
                DefaultTextFormField(
                  hintText: tr.guests,
                  enabled: false,
                ),
                SizedBox(
                  height: 25.h,
                ),
                DefaultButton(
                  height: 50.h,
                  color: buttonColor,
                  text: tr.searchHotels,
                  textSize: 20,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    context.pushNamed(Routes.searchResultsScreen.name);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
