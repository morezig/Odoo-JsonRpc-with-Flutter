import 'package:flutter/material.dart';

import 'common/api_factory/dio_factory.dart';
import 'common/app.dart';
import 'common/config/dependencies.dart';
import 'common/config/prefs/pref_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Controller dependencies which we use throughout the app
  Dependencies.injectDependencies();

  DioFactory.initialiseHeaders(await PrefUtils.getToken());

  bool isLoggedIn = await PrefUtils.getIsLoggedIn();
  runApp(App(isLoggedIn));
}
