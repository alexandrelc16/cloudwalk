import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../country_details/country_details_route_arguments.dart';
import '../country_details/country_details_view.dart';
import 'country_list_item.dart';
import '../weather_controller.dart';

class CountryListView extends StatefulWidget {
  const CountryListView({
    super.key,
    required this.controller,
    required this.countryList,
  });

  final List<CountryListItem> countryList;
  final WeatherController controller;

  @override
  State<CountryListView> createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  final TextEditingController _controller = TextEditingController();
  List<CountryListItem> searchItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchByCountry,
            ),
            onChanged: onSearchTextChanged,
          ),
        ),
        Expanded(
          child: ListView.builder(
            restorationId: 'countryListView',
            itemCount: searchItems.isEmpty
                ? widget.countryList.length
                : searchItems.length,
            itemBuilder: (BuildContext context, int index) {
              final item = searchItems.isEmpty
                  ? widget.countryList[index]
                  : searchItems[index];

              return ListTile(
                title: Text(item.label),
                leading: const CircleAvatar(
                  foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                ),
                onTap: () {
                  widget.controller
                      .fetchCoordinatesByLocationName(item.value)
                      .then(
                        (response) => {
                          Navigator.pushNamed(
                            context,
                            CountryDetailsView.routeName,
                            arguments: CountryDetailsRouteArguments(item.label),
                          ),
                        },
                      );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  onSearchTextChanged(String text) async {
    searchItems.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var countryList in widget.countryList) {
      if (countryList.label.toLowerCase().contains(text)) {
        searchItems.add(countryList);
      }
    }

    setState(() {});
  }
}
