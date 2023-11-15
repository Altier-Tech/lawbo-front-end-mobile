// result.dart
class Result {
  final String result;

  Result({required this.result});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(result: json['result']);
  }
}
