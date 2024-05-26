import 'country_list_item.dart';

class CountryListController {
  static const List<CountryListItem> countryList = [
    CountryListItem(
      id: 1,
      label: 'Silverstone, UK',
      value: 'Silverstone,England,GB',
    ),
    CountryListItem(
      id: 2,
      label: 'São Paulo, Brazil',
      value: 'São Paulo,São Paulo,BR',
    ),
    CountryListItem(
      id: 3,
      label: 'Melbourne, Australia',
      value: 'Melbourne,Victoria,AU',
    ),
    CountryListItem(
      id: 4,
      label: 'Monte Carlo, Monaco',
      value: 'Monte Carlo,Monaco,MC',
    )
  ];
}
