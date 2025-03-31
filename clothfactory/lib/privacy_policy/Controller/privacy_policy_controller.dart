import '../../api_services/api_services.dart';
import '../../api_services/enviorment.dart';

class PrivacyPolicyController {
  static Future privacyPolicy() async {
    String params = "?token=dL1k0is9zSGoyuHEtUK6VUIhfs507Wbd";
    Uri tcUrl = Uri.parse(Enviorment.pp_url + EndPoint.pp_end_point + params);
    dynamic tcApicall = await ApiService.getMethod(tcUrl);
    // print("Api call");
    // print(tcApicall.body.toString());
    //Logger().v("Api Call");
    // Logger().d(tcApicall.body);
    return tcApicall.body;
  }
}
