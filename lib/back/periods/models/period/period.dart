class Period {
  String id;
  String name;
  String description;
  String startDate;
  String endDate;
  String startTIme;
  String endTIme;
  String poolID;
  String userID;
  String level;
  String price;
  String? teacher;
  String? teacherImage;
  String poolName;
  String status;

  Period(
      {required this.id,
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
      required this.userID});

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
        id: json['id'],
        description: json['description'],
        endDate: json['end_date'],
        endTIme: json['time_end'],
        level: json['level'],
        name: json['name'],
        poolID: json['pool_id'],
        poolName: json['pool'],
        price: json['price'],
        startDate: json['start_date'],
        startTIme: json['time_start'],
        status: json['status'],
        teacher: json['teacher'],
        teacherImage: json['teacher_image'],
        userID: json['user_id']);
  }
}
