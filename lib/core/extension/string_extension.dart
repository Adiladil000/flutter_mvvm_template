import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail => contains(RegExp(ApplicationConstants.EMAIL_REQIEX)) ? null : "Email does not valid";

  bool get isValidEmails => RegExp(ApplicationConstants.EMAIL_REQIEX).hasMatch(this);
}

extension ImagePathExtension on String {
  String get toSVG => "asset/svg/$this.svg";
}
