import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/app_controller/app_controller_cubit.dart';
import 'package:news_peoject/bloc/new_controller/news_controller_cubit.dart';
import 'package:news_peoject/shared/style/custom_dark_mode.dart';
import 'package:news_peoject/shared/style/custom_light-mode.dart';
import 'package:news_peoject/translations/codegen_loader.g.dart';
import 'package:news_peoject/translations/locale_keys.g.dart';
import 'package:news_peoject/ui/screens/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    assetLoader: CodegenLoader(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppControllerCubit()..cubitInit(),
        ),
        BlocProvider(create: (context)=>NewsControllerCubit()..getSources()..getTrending()..getSports()),
      ],
      child: BlocBuilder<AppControllerCubit, AppControllerState>(
        builder: (context, state) {
          AppControllerCubit appController = BlocProvider.of<AppControllerCubit>(context);
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: customLightMode(),
            darkTheme: customDarkMode(),
            themeMode: appController.isDark?ThemeMode.dark:ThemeMode.light,
            home: DashBoardScreen(),
          );
        },
      ),
    );
  }
}
