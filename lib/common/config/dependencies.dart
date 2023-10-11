import 'package:get/get.dart';

import '../../src/authentication/controllers/signin_controller.dart';

class Dependencies {
  Dependencies._();

  static void injectDependencies() {
    Get.put(SignInController());
  }
}
