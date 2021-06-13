class User {
  int? id;
  String? username;
  String? senha;
  String? token;

  User({this.id, this.username, this.senha});

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.username = json['username'];
    this.senha = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.senha;
    return data;
  }
}
