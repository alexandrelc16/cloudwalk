import 'package:cloudwalk/src/weather/country_details/country_details_route_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'weather/country_details/country_details_view.dart';
import 'weather/weather_controller.dart';
import 'home/home_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.weatherController,
  });

  final SettingsController settingsController;
  final WeatherController weatherController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case CountryDetailsView.routeName:
                    final args =
                        routeSettings.arguments as CountryDetailsRouteArguments;
                    return CountryDetailsView(
                      title: args.title,
                      controller: weatherController,
                    );
                  case HomeView.routeName:
                  default:
                    return HomeView(controller: weatherController);
                }
              },
            );
          },
        );
      },
    );
  }
}
