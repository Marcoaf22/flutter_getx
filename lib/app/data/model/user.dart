import 'package:getx/app/data/model/tex.dart';

class User {
  final String id, name, email, phone, ci;
  final String? photo_path;

  User({
    required this.ci,
    required this.id,
    required this.name,
    required this.email,
    this.photo_path,
    required this.phone,
  });

  // User setAvatar(String url) {
  //   return User(
  //       id: this.id,
  //       username: this.username,
  //       createdAt: this.createdAt,
  //       email: this.email,
  //       updatedAt: this.updatedAt,
  //       avatar: url);
  // }

  static User fromJson(Map<String, dynamic> json) {
    print('User fromJson');
    String? photo;
    // print(json['user']['profile_photo_path']);
    if (json['user']['profile_photo_path'].toString().length > 3) {
      print('entro');
      photo = json['user']['profile_photo_path'];
    }

    return User(
      ci: json['persona']['ci'].toString(),
      id: json['user']['id'].toString(),
      name: json['user']['name'],
      photo_path: photo,
      email: json['user']['email'],
      phone: json['persona']['telefono'].toString(),
    );
  }

  static User fromRegister(Map<String, dynamic> json) {
    return User(
      ci: json['persona']['ci'],
      phone: json['persona']['telefono'],
      id: json['persona']['id'],
      email: json['usuario']['email'],
      name: json['usuario']['name'],
      photo_path: json['usuario']['profile_photo_path'],
    );
  }

  static User fromUserSave(Map<String, dynamic> json) {
    return User(
      ci: json['ci'],
      id: json['id'],
      name: json['name'],
      photo_path: json['photo_path'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ci': this.ci,
      'id': this.id,
      'name': this.name,
      'photo_path': this.photo_path,
      'phone': this.phone,
      'email': this.email
    };
  }
}
