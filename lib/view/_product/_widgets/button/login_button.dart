import 'package:flutter/material.dart';

import '../../../../core/components/button/icon_button.dart';

class NVVMLoginButton extends StatelessWidget {
  final Function(String data) onComplete;

  const NVVMLoginButton({Key? key, required this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
        icon: Icons.access_alarm,
        onPressed: () {
          onComplete('Okey');
        });
  }
}
