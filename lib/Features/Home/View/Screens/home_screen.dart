import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:offto/Core/Shared%20Cubit/Theme/theme_cubit.dart';
import 'package:offto/Features/Home/Bloc/home_cubit.dart';
import '../../../../Core/Const/colors.dart';
import '../../../../Routing/routes.dart';
import '../../../../generated/l10n.dart';
import '../Widgets/button_widget.dart';
import '../Widgets/Selector_widget.dart';
import '../Widgets/city_search_widget.dart';
import '../Widgets/packages_widget.dart';
import '../Widgets/select_dates_widget.dart';
import '../Widgets/select_guests_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .05.sw),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                var themeCubit = ThemeCubit.get(context);
                return Column(
                  children: [
                    SizedBox(
                      height: .1.sh,
                    ),
                    Column(
                      children: [
                        ///Change language
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr.language,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: cubit.currentLanguage == "en",
                              onChanged: (value) {
                                cubit.clearValues();
                                cubit.toggleLanguage();
                              },
                              activeTrackColor: Colors.blue[200],
                              activeColor: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        ///Change theme
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              tr.theme,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: !themeCubit.isLight,
                              onChanged: (value) {
                                themeCubit.changeTheme();
                              },
                              activeTrackColor: Colors.grey[400],
                              activeColor: Colors.black,
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(height: 10.h),

                    ///Packages and flights
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
                        fontSize: 22.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    ///Select city
                    SelectorWidget(
                      hintText: tr.to,
                      selectedText: cubit.toText,
                      bottomSheet: BlocProvider.value(
                        value: cubit,
                        child: const FractionallySizedBox(
                          heightFactor: 0.85,
                          child: CitySearchBottomSheet(),
                        ),
                      ),
                      onFetchCities: () {
                        context.read<HomeCubit>().getCities(
                            search: '', lang: cubit.currentLanguage);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    ///Select Dates
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
                          child: DatePickerBottomSheet(),
                        ),
                      ),
                      onFetchCities: () {},
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ///Select guests
                    SelectorWidget(
                      hintText: tr.guests,
                      selectedText: cubit.guestSummary.isNotEmpty
                          ? cubit.guestSummary
                          : "",
                      bottomSheet: BlocProvider.value(
                        value: cubit,
                        child: GuestsBottomSheet(),
                      ),
                      onFetchCities: () {},
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
            );
          },
        ),
      ),
    );
  }
}
