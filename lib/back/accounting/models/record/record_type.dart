

class RecordType {
  String id;
  String title;

  RecordType({required this.id, required this.title});

  factory RecordType.fromJson(Map<String, dynamic> json) {
    return RecordType(id: json['id'], title: json['name']);
  }

}
