class Record {
  String id;
  int record;
  String time;
  String subject;
  String recordCat;
  String date;
  String? recordTitle;
  int sequence;
  static int curSeq = 0;
  static int min = 1000000000;
  static int max = 0;

  static get actualMin => min - 1000;

  Record(
      {required this.id,
      required this.record,
      required this.time,
      required this.subject,
      required this.recordCat,
      required this.date,
      this.recordTitle,
      required this.sequence});

  factory Record.fromJson(Map<String, dynamic> json) {
    int tempRecord = json['record'];
    if (tempRecord < Record.min) {
      min = tempRecord;
    }
    if (tempRecord > Record.max) {
      max = tempRecord;
    }
    return Record(
        id: json['id'],
        record: json['record'],
        time: json['time'],
        subject: json['subject'],
        date: json['date'],
        recordCat: json['record_cat'],
        recordTitle: json['subject'],
        sequence: curSeq++);
  }

  static reset() {
    min = 1000000000;
    max = 0;
    curSeq = 0;
  }
}
