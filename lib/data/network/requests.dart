class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class ClientRegistrationRequest {
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  String role;

  ClientRegistrationRequest(this.name, this.email, this.phone, this.password,
      this.confirmPassword, this.role);
}
