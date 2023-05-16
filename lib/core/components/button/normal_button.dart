import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const NormalButton({Key? key, required this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 10,
      padding: const EdgeInsets.all(15),
      onPressed: onPressed,
      child: const Text('data'),
    );
  }
}
