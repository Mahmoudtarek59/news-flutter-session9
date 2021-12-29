import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/app_controller/app_controller_cubit.dart';
import 'package:news_peoject/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_peoject/ui/widgets/dashboard_widgets/country_picker.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppControllerCubit, AppControllerState>(
      builder: (context, state) {
        AppControllerCubit appController =
            BlocProvider.of<AppControllerCubit>(context);
        return Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryPicker(),
              SwitchListTile(
                value: appController.isDark,
                title: Text(
                  LocaleKeys.dark.tr(),
                ),
                secondary: Icon(
                  Icons.mode_night_outlined,
                  color: appController.isDark ? Colors.white : Colors.black,
                ),
                onChanged: appController.changeAppMode,
              ),
            ],
          ),
        );
      },
    );
  }
}
