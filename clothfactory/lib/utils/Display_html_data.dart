import 'package:clothfactory/utils/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Displayhtmldata extends StatelessWidget {
  const Displayhtmldata({
    Key? key,
    required String htmlResponse,
  })  : _tcResponse = htmlResponse,
        super(key: key);

  final String _tcResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConstant.appPadding),
      child: SingleChildScrollView(child: HtmlWidget(_tcResponse)),
    );
  }
}
