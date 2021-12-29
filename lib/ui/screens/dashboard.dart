import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_peoject/bloc/app_controller/app_controller_cubit.dart';
import 'package:news_peoject/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:news_peoject/ui/widgets/dashboard_widgets/custom_drawer.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppControllerCubit, AppControllerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppControllerCubit appController = BlocProvider.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                appController.btmItems[appController.index].label.toString()),
          ),
          drawer: CustomDrawer(),
          bottomNavigationBar: BottomNavigationBar(
            items: appController.btmItems,
            currentIndex: appController.index,
            onTap: appController.changeIndex,
          ),
          body: appController.screens[appController.index],
        );
      },
    );
  }
}
