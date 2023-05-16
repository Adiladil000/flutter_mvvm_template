// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  final Function(FaceBookModel? data, {String? errorMessage}) onComplete;

  const FaceBookButton({Key? key, required this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: 'FaceBook login',
      onPressed: () {
        const isLengthSixCharacter = 'adadad'.length == 6;
        if (isLengthSixCharacter) {
          onComplete(FaceBookModel('asasasa', 'adadadad'));
        } else {
          onComplete(null, errorMessage: 'Facebook user  not  found');
        }
      },
    );
  }
}

class FaceBookModel {
  final String token;
  final String mail;
  FaceBookModel(this.token, this.mail);
}
