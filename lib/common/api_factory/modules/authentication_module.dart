import 'dart:convert';

import 'package:get/get.dart';

import '../../../src/authentication/controllers/signin_controller.dart';
import '../../../src/authentication/models/user_model.dart';
import '../../../src/authentication/views/signin.dart';
import '../../../src/home/view/home.dart';
import '../../config/config.dart';
import '../../config/prefs/pref_utils.dart';
import '../../utils/utils.dart';
import '../../widgets/log.dart';
import '../api.dart';

getVersionInfoAPI() {
  Api.getVersionInfo(
    onResponse: (response) {
      Api.getDatabases(
        serverVersionNumber: response.serverVersionInfo![0],
        onResponse: (response) {
          Log(response);
          Config.DB = response[0];
        },
        onError: (error, data) {
          handleApiError(error);
        },
      );
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

authenticationAPI(String email, String pass) {
  Api.authenticate(
    username: email,
    password: pass,
    database: Config.DB,
    onResponse: (UserModel response) {
      currentUser.value = response;
      PrefUtils.setIsLoggedIn(true);
      PrefUtils.setUser(jsonEncode(response));
      Get.offAll(() => Home());
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

logoutApi() {
  Api.destroy(
    onResponse: (response) {
      PrefUtils.clearPrefs();
      Get.offAll(() => SignIn());
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}
