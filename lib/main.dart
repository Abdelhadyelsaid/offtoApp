import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:offto/Core/Const/colors.dart';
import 'Core/Helper/dio_helper.dart';
import 'Core/Observers/bloc_observer.dart';
import 'Core/Shared Cubit/Theme/theme_cubit.dart';
import 'Features/Home/Bloc/home_cubit.dart';
import 'Routing/router.dart';
import 'generated/l10n.dart';

void main() async {
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(390, 844),
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeCubit()),
              BlocProvider(create: (context) => ThemeCubit()),
            ],
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, homeState) {
                return BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        scaffoldBackgroundColor: state is ThemeDark
                            ? Colors.grey[900]
                            : backgroundColor,
                        brightness: state is ThemeDark
                            ? Brightness.dark
                            : Brightness.light,
                        useMaterial3: false,
                      ),
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      locale: homeState is ChangeLanguageState
                          ? homeState.locale
                          : null,
                      routerConfig: CustomRouter.router,
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
