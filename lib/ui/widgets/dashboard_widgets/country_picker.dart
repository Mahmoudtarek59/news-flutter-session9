import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';


class CountryPicker extends StatelessWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryListPick(
        appBar: AppBar(
          // backgroundColor: Colors.blue,
          title: Text('Country'),
        ),

        // if you need custome picker use this
        pickerBuilder: (context, CountryCode? countryCode){
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
            title:
            Text(countryCode!.name.toString()),
            leading: Image.asset(
            countryCode.flagUri.toString(),
              height: 25.0,
              width: 30.0,
            package: 'country_list_pick',
          ),
            trailing: Icon(Icons.expand_more_rounded,color: Theme.of(context).textTheme.bodyText2!.color,),
          );
        },

        // To disable option set to false
        theme: CountryTheme(
          isShowFlag: true,
          isShowTitle: true,
          isShowCode: false,
          isDownIcon: true,
          showEnglishName: true,
          alphabetSelectedTextColor: Theme.of(context).textTheme.bodyText1!.color,
          alphabetTextColor: Theme.of(context).colorScheme.onPrimary,
          alphabetSelectedBackgroundColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.primary,
        ),
        // Set default value
        // initialSelection: '+62',
        // or
        initialSelection: 'eg',
        onChanged: (CountryCode? code) {
          print(code!.name);
          print(code.code);
          print(code.dialCode);
          print(code.flagUri);
        },
        // Whether to allow the widget to set a custom UI overlay
        useUiOverlay: true,
        // Whether the country list should be wrapped in a SafeArea
        useSafeArea: false
    );
  }
}
