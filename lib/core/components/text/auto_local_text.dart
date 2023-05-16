import 'package:flutter/material.dart';
import '../../extension/string_extension.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoLocaleText extends StatelessWidget {
  final String value;
  final TextAlign? textAlign;
  final TextStyle style;
  const AutoLocaleText({Key? key, required this.value, required this.textAlign, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value.locale,
      style: style,
      textAlign: textAlign,
    );
  }
}
