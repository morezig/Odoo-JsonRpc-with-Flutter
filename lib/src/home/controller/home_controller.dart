import 'package:get/get.dart';

import '../../../common/api_factory/modules/home_api_module.dart';
import '../model/res_partner_model.dart';

class HomeController extends GetxController {
  var listOfPartners = <Records>[].obs;

  getPartners() {
    resPartnerApi(
      onResponse: (response) {
        listOfPartners.assignAll(response.records!);
      },
    );
  }
}
