import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_api_abstract.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:http/http.dart' as http;

import 'abstracts/accounting_repo_abstract.dart';

class AccountingRepo implements AccountingRepositoryInterface {
  Swimmer? _activeSwimmer;
  List<Swimmer>? _relativeSwimmers;
  RegisterState _registerState = RegisterState.Nothing;


  // defining Controllers
  final _activeSwimmerController = StreamController<Swimmer>();
  final _relativeSwimmersController = StreamController<List<Swimmer>>();

  final _registerStateController = StreamController<RegisterState>();

  // get Stream of Controllers
  Stream<Swimmer> get activeSwimmerStream => _activeSwimmerController.stream;

  Stream<List<Swimmer>> get relativeSwimmersStream =>
      _relativeSwimmersController.stream;

  Stream<RegisterState> get registerStateStream =>
      _registerStateController.stream;


  UserStoredData userStoredData;
  AccountingApiInterface accountingApi;

  AccountingRepo({required this.userStoredData, required this.accountingApi});


  @override
  getActiveSwimmerStream() {
    // _activeSwimmer =
  }

  @override
  getRegisterStateStream() {
    _registerState = userStoredData.getRegisterState();
    _registerStateController.sink.add(_registerState);
  }

  @override
  getRelatedSwimmerStream() {

  }
  
}

extension on AccountingRepo {}
