class RegisteredPeriod {
  String registerPeriodId;
  String id;
  String name;
  String description;
  String startDate;
  String endDate;
  String startTIme;
  String endTIme;
  String poolID;
  String poolName;
  String userID;
  String level;
  String price;
  String teacher;
  String teacherImage;
  String status;
  String pType;
  String allSessions;
  String presents;
  String absents;
  String nextSession;
  String passedSession;
  String score;

  String get remainedSessions =>
      (int.parse(allSessions) - int.parse(passedSession)).toString();

  RegisteredPeriod({
    required this.registerPeriodId,
    required this.id,
    required this.description,
    required this.endDate,
    required this.endTIme,
    required this.level,
    required this.name,
    required this.poolID,
    required this.poolName,
    required this.price,
    required this.startDate,
    required this.startTIme,
    required this.status,
    required this.teacher,
    required this.teacherImage,
    required this.userID,
    required this.pType,
    required this.allSessions,
    required this.presents,
    required this.absents,
    required this.nextSession,
    required this.passedSession,
    required this.score,
  });

  factory RegisteredPeriod.fromJson(Map<String, dynamic> json) {
    return RegisteredPeriod(
        registerPeriodId: json['reg_period_id'],
        id: json['id'],
        description: json['description'],
        endDate: json['end_date'],
        endTIme: json['time_end'],
        level: json['level'],
        name: json['name'],
        poolID: json['pool_id'],
        poolName: json['pool_name'],
        price: json['price'],
        startDate: json['start_date'],
        startTIme: json['time_start'],
        status: json['status'],
        teacher: json['teacher'],
        teacherImage: json['teacher_image'],
        userID: json['user_id'],
        pType: json['ptype'],
        allSessions: json['allsession'],
        absents: json['absent'],
        presents: json['peresent'],
        nextSession: json['nextsession'],
        passedSession: json['lastsession'],
        score: json['score']);
  }
}
