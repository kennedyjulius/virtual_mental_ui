class UserModel {
  List<String>? username;
  List<String>? password;
  List<String>? password2;
  List<String>? email;

  UserModel({this.username, this.password, this.password2, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'].cast<String>();
    password = json['password'].cast<String>();
    password2 = json['password2'].cast<String>();
    email = json['email'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['password2'] = this.password2;
    data['email'] = this.email;
    return data;
  }
}