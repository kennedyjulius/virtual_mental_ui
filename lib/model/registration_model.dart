class RegisterUser{
  String email;
  String name;
  String password;
  String passwordConfirm;

  RegisterUser({
    required this.email,
    required this.name,
    required this.password,
    required this.passwordConfirm
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email']=email;
    data['username']=name;
    data['password']=password;
    data['password2']=passwordConfirm;
    return data;
  }
}