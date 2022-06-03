// import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:getx/app/data/model/user.dart';

class Session {
  final String token;
  final int? expiresIn;
  final DateTime createdAt;

  Session({
    required this.token,
    required this.createdAt,
    required this.expiresIn,
  });

  static Session fromJson(Map<String, dynamic> json) {
    return Session(
      expiresIn: json['expiresIn'],
      token: json['token'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": this.token,
      "expiresIn": this.expiresIn,
      "createdAt": this.createdAt.toString()
    };
  }
}

class Auth {
  Auth._internal();

  static Auth _instance = Auth._internal();

  static Auth get instance => _instance;

  // final _storage = FlutterSecureStorage();
  final _storage = GetStorage();

  final key = "SESSION";
  final keyInfo = "INFO";

  Future<void> setSession(Map<String, dynamic> data) async {
    print('🎁 setSession');
    final Session session = Session(
      token: data['token'],
      expiresIn: null,
      // expiresIn: data['expiresIn'],
      createdAt: DateTime.now(),
    );

    final User user = User.fromJson(data);
    // print(user);
    final String info = jsonEncode(user.toJson());
    final String value = jsonEncode(session.toJson());

    this._storage.write(this.key, value);
    this._storage.write(this.keyInfo, info);
    this._storage.save();
    print(session.token);
    print('🎀 Session Saved');
  }

  Future<void> setSessionRegister(Map<String, dynamic> data) async {
    print('🎁 setSession');
    final Session session = Session(
      token: data['token'],
      expiresIn: null,
      // expiresIn: data['expiresIn'],
      createdAt: DateTime.now(),
    );

    final User user = User.fromJson(data);
    print(user);
    final String info = jsonEncode(user.toJson());
    final String value = jsonEncode(session.toJson());

    this._storage.write(this.key, value);
    this._storage.write(this.keyInfo, info);
    this._storage.save();
    print(session.token);
    print('🎀 Session Saved');
  }

  Future<Session?> getSession() async {
    final String value = await this._storage.read(this.key);
    print('🎃 ' + value);
    // if (value != null) {
    final Map<String, dynamic> json = jsonDecode(value);
    final session = Session.fromJson(json);
    return session;
  }

  Future<User> getUser() async {
    final String value = await this._storage.read(this.keyInfo);
    print('🎃 getUser');
    print(value);
    final Map<String, dynamic> json = jsonDecode(value);
    final user = User.fromUserSave(json);
    return user;
  }

  Future<void> logOut() async {
    this._storage.remove(this.key);
    this._storage.remove(this.keyInfo);
  }
}
