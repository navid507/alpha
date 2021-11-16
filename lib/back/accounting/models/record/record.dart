
class Record {
  String id;
  String record;
  String time;
  String subject;
  String recordCat;
  String date;
  String? recordTitle;

  Record(
      {required this.id,
      required this.record,
      required this.time,
      required this.subject,
      required this.recordCat,
      required this.date,
      this.recordTitle});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
        id: json['id'],
        record: json['record'],
        time: json['time'],
        subject: json['subject'],
        date: json['date'],
        recordCat: json['record_cat'],
        recordTitle: json['record_title']);
  }
}
