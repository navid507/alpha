import 'package:alpha/back/accounting/accounting_api.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHttpFunctions extends Mock
    implements HttpFunctionsInterface {
}

void main() {
  late MockHttpFunctions mockHttpFunctions;
  late AccountingAPI accountingAPI;
  setUp(() {
    mockHttpFunctions = MockHttpFunctions();
    accountingAPI = AccountingAPI(http: mockHttpFunctions);
  });
  // test('test register phone ',() async {
  //   when(mockHttpFunctions.get(url: AccountingURLs.Register)).thenAnswer((realInvocation) => Future(<>));
  // accountingAPI.registerPhone(phone: "phone", uid: "uid");
  //
  // });
}