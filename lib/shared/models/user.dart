import 'dart:convert';

class User {
  final name;
  final avatarUrl;

  User({required this.name, this.avatarUrl});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(name: map['name'], avatarUrl: map['avatarUrl']);
  }

  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "name": name,
        "avatarUrl": avatarUrl,
      };

  String toJson() => jsonEncode(toMap());
}
