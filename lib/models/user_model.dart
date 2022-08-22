import 'dart:convert';

class UserModel {
  String? email;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? age;
  UserModel({
    this.email,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.age,
  });

  UserModel copyWith({
    String? email,
    String? createdAt,
    String? updatedAt,
    String? name,
    int? age,
  }) {
    return UserModel(
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'name': name,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['user']['email'],
      createdAt: map['user']['createdAt'],
      updatedAt: map['user']['updatedAt'],
      name: map['user']['name'],
      age: map['user']['age'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(email: $email, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name &&
        other.age == age;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        name.hashCode ^
        age.hashCode;
  }
}
