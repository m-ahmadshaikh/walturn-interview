import 'dart:convert';

class UserModel {
  User? user;
  String? token;
  UserModel({
    this.user,
    this.token,
  });

  UserModel copyWith({
    User? user,
    String? token,
  }) {
    return UserModel(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user: User.fromMap(map['user']),
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(user: $user, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.user == user && other.token == token;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}

class User {
  int? age;
  String? sId;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  int? iV;
  User({
    this.age,
    this.sId,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  User copyWith({
    int? age,
    String? sId,
    String? name,
    String? email,
    String? createdAt,
    String? updatedAt,
    int? iV,
  }) {
    return User(
      age: age ?? this.age,
      sId: sId ?? this.sId,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      iV: iV ?? this.iV,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'sId': sId,
      'name': name,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'iV': iV,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      age: map['age'],
      sId: map['sId'],
      name: map['name'],
      email: map['email'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      iV: map['iV'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(age: $age, sId: $sId, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, iV: $iV)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.age == age &&
        other.sId == sId &&
        other.name == name &&
        other.email == email &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.iV == iV;
  }

  @override
  int get hashCode {
    return age.hashCode ^
        sId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        iV.hashCode;
  }
}
