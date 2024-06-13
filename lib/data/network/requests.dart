class LoginRequest {
  String email;
  String password;

  LoginRequest({ required this.email,required this.password});
}

class ClientRegistrationRequest {
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String role;

  ClientRegistrationRequest(
      {
        required this.name,
      required this.email,
     required this.phone,
     required this.password,
     required this.confirmPassword,
     required this.role});
}
