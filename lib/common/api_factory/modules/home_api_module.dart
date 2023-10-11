import '../../../src/home/model/res_partner_model.dart';
import '../../utils/utils.dart';
import '../api.dart';
import '../dio_factory.dart';

resPartnerApi({required OnResponse<ResPartnerModel> onResponse}) {
  Api.searchRead(
    model: "res.partner",
    domain: [],
    fields: ["name", "email", "image_512"],
    onResponse: (response) {
      onResponse(ResPartnerModel.fromJson(response));
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}
