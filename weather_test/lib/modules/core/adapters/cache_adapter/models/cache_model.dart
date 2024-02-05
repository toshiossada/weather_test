import 'dart:convert';

class CacheModel {

  const CacheModel({
    required this.id,
    required this.date,
    required this.data,
  });
  final String id;
  final DateTime date;
  final Map<dynamic, dynamic> data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'data': data,
    };
  }

  String toJson() => json.encode(toMap());
}
