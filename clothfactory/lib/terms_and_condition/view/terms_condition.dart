import 'package:clothfactory/terms_and_condition/controller/terms_and_condition_control.dart';
import 'package:flutter/material.dart';
import '../../utils/Display_html_data.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  String _tcResponse = "";
  bool _loading = false;
  @override
  void initState() {
    callApi();
    super.initState();
  }

  Future callApi() async {
    setState(() {
      _loading = true;
    });
    _tcResponse = await TermsAndConditionController.termsAndCondition();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Condition"),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Displayhtmldata(htmlResponse: _tcResponse),
    );
  }
}
