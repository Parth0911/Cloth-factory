import 'package:clothfactory/api_services/api_services.dart';
import 'package:clothfactory/api_services/enviorment.dart';
import 'package:logger/logger.dart';

class TermsAndConditionController {
  static Future termsAndCondition() async {
    String params = "?lang=en&token=HfROuWIzj8TUnRI9WHAvY9yeKt5yuQbe";
    Uri tcUrl = Uri.parse(Enviorment.base_url + EndPoint.end_point + params);
    dynamic tcApicall = await ApiService.getMethod(tcUrl);
    // print("Api call");
    // print(tcApicall.body.toString());
    //Logger().v("Api Call");
    // Logger().d(tcApicall.body);
    return tcApicall.body;
  }
}
