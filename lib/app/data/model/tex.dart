import 'dart:convert';

class Tex {
  Tex({
    required this.hola,
    required this.entero,
    required this.userBool,
  });

  dynamic hola;
  int entero;
  bool userBool;

  Tex texFromJson(String str) => Tex.fromJson(json.decode(str));

  String texToJson(Tex data) => json.encode(data.toJson());

  Tex copyWith({
    dynamic? hola,
    int? entero,
    bool? userBool,
  }) {
    return Tex(
      hola: hola ?? this.hola,
      entero: entero ?? this.entero,
      userBool: userBool ?? this.userBool,
    );
  }

  factory Tex.fromJson(Map<String, dynamic> json) {
    return Tex(
      hola: json["hola"],
      entero: json["entero"] ?? 0,
      userBool: json["bool"] ?? false,
    );
  }

  @override
  String toString() {
    return '$hola, $entero, $userBool';
  }

  Map<String, dynamic> toJson() => {
        "hola": hola,
        "entero": entero,
        "bool": userBool,
      };
}
