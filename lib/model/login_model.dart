class UserLogin{
  String username;
  String password;

  UserLogin({
    required this.username,
    required this.password
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username']=this.username;
    data['password']=this.password;
    return data;
  }
}