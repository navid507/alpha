

class StateResult {
  String msg = "";
  int error = 0;

  bool get isSuccess => error == 0;

  StateResult({required this.msg, required this.error});

  factory StateResult.fromJson(Map<String, dynamic> json) {
    return StateResult(msg: json['msg'], error: json['error']);
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'error': error,
    };
  }
}

class APIResult {
  StateResult state;
  dynamic data;

  bool get isSuccess => state.isSuccess;


  APIResult({required this.state, this.data});

  factory APIResult.fromJson(Map<String, dynamic> json) {
    StateResult stateResult = StateResult.fromJson(json['state']);
    if (json.containsKey('data')) {
      return APIResult(state: stateResult, data: json['data']);
    } else {
      return APIResult(state: stateResult);
    }
  }

  Map<String, dynamic> toJson() {
    if (data != null) {
      return {
        'state': state,
        'data': data,
      };
    } else {
      return {'state': state};
    }
  }
}
