// import 'package:flutter_test/flutter_test.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'onbord_mock_view_model.dart';


//TODO :  test
// main() {
//   OnBoardMockViewModel? mockViewModel;
//   IStringHelper? stringHelper;
//   setUp(() {
//     SharedPreferences.setMockInitialValues({"token": "sdsd"});

//     mockViewModel = OnBoardMockViewModel();
//     stringHelper = MockStringHelper();
//     mockViewModel!.init();
//   });
//   test('String Helper Upper Case', () {
//     String text = 'Hello';
//     text = stringHelper!.toUpper(text);

//     expect(text.contains(RegExp("[A-Z]s]+")), true);
//   });

//   test('OnBoard Get Models', () async {
//     await mockViewModel!.onBoardGetModels();
//     expect(mockViewModel!.onBoardModel, isNotEmpty);
//   });

//   test('OnBoard Get Service Request', () async {
//     expect(mockViewModel!.isLoading, false);

//     await mockViewModel!.onBoardGetModels();
//     expect(mockViewModel!.isLoading, true);
//   });

//   test('OnBoard On Page Changed', () {
//     mockViewModel!.onPageChanged(5);
//     expect(5, mockViewModel!.currentPageIndex);
//   });

//   group("Test All", () {
//     int index = 0;
//     test('OnBoard Get Models', () async {
//       await mockViewModel!.onBoardGetModels();
//       index = mockViewModel!.onBoardModel.length;

//       expect(mockViewModel!.onBoardModel, isNotEmpty);
//     });
//     test('OnBoard On Page Changed', () {
//       expect(mockViewModel!.onBoardModel.length, mockViewModel!.currentPageIndex);

//       mockViewModel!.onPageChanged(5);
//       expect(index, mockViewModel!.currentPageIndex);
//     });
//   });
// }
