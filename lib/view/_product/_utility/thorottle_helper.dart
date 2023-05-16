import 'dart:async';

class ThorottleStringHelper {
  String? _pastText;

  final int __maxTimerValue = 5;
  int _timerValue = 0;
  ThorottleStringHelper() {
    _onSetMaxValue();
  }

  void onDelayTouch(String text, Function(String text) onComplete) {
    _pastText = text;

    if (_timerValue == __maxTimerValue) {
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        _timerValue--;

        if (_timerValue == 0) {
          onComplete(_pastText.toString());
          timer.cancel();
          _onSetMaxValue();
        }
      });
    } else {
      _onSetMaxNearValue();
    }
  }

  void _onSetMaxValue() {
    _timerValue = __maxTimerValue;
  }

  void _onSetMaxNearValue() {
    _timerValue = __maxTimerValue - 1;
  }
}
