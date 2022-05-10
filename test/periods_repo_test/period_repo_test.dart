import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/period_result.dart';
import 'package:alpha/back/periods/models/period/registered_period.dart';
import 'package:alpha/back/periods/models/period/registered_period_result.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'period_repo_test.mocks.dart';

@GenerateMocks([PeriodsApi, SessionApi, AccountingRepo])
void main() {
  late MockPeriodsApi mockPeriodApis = MockPeriodsApi();
  late MockSessionApi mockSessionApi = MockSessionApi();
  late MockAccountingRepo mockAccountingRepo = MockAccountingRepo();

  late PeriodsRepoInterface periodRepo;

  const String sampleToken = 'token';
  const int sampleUserID = 10;

  setUp(() {
    periodRepo = PeriodsRepo.getInstance(
        periodsApiInterface: mockPeriodApis,
        sessionsApiInterface: mockSessionApi,
        accountingRepositoryInterface: mockAccountingRepo);

    when(mockAccountingRepo.userID)
        .thenAnswer((realInvocation) => sampleUserID);
    when(mockAccountingRepo.token)
        .thenAnswer((realInvocation) => Future.value(sampleToken));
  });

  test('is get active period details ok', () async {
    var activePeriod = RegisteredPeriod(
        id: '10',
        description: 'description',
        endDate: 'endDate',
        endTIme: 'endTIme',
        level: '1',
        name: 'name',
        poolID: 'assets/images/2x/splash_screen.png',
        poolName: 'poolName',
        price: 'price',
        startDate: 'startDate',
        startTIme: 'startTIme',
        status: 'status',
        teacher: 'teacher',
        userID: 'userID',
        absents: '',
        teacherImage: '',
        presents: '',
        registerPeriodId: '',
        score: '',
        passedSession: '',
        nextSession: '',
        pType: '',
        allSessions: '');
    when(mockSessionApi.getActivePeriodDetails(
            userID: sampleUserID, token: sampleToken))
        .thenAnswer((realInvocation) async =>
            RegisteredPeriodResult.success(activePeriod));

    periodRepo.getActivePeriod();
    // periodRepo.activePeriodStream.listen((Period period) {
    //   expect(period.id, equals('10'));
    // }, onError: (error) {
    //   fail('problem $error');
    // }, onDone: () {});
  });

  test('is get error of active period details ok', () async {
    when(mockSessionApi.getActivePeriodDetails(
            userID: sampleUserID, token: sampleToken))
        .thenAnswer((realInvocation) async =>
            RegisteredPeriodResult.error(1, 'no active period found'));

    periodRepo.getActivePeriod();

    periodRepo.activePeriodErrorStream
        .listen(expectAsync1<void, String>((event) {
      expect(event.isEmpty, equals(false));
    }));
  });
}
