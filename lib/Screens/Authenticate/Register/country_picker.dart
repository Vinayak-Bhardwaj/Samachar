import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {


  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: () {
            showCountryPicker(
              context: context,
              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
              exclude: <String>['KN', 'MF'],
              //Optional. Shows phone code before the country name.
              showPhoneCode: true,
              onSelect: (Country country) {
                print('Select country: ${country.displayName}');
                print('Country code for the country : ${country.phoneCode}');
              },
              // Optional. Sets the theme for the country list picker.
              countryListTheme: CountryListThemeData(
                // Optional. Sets the border radius for the bottomsheet.
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                // Optional. Styles the search field.
                inputDecoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            );
          },
          child: const Text('Show country picker'),
        );
  }
}
