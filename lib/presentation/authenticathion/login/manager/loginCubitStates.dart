abstract class LoginCubitStates {}

class LoginInitial extends LoginCubitStates {}

class LoginSuccess extends LoginCubitStates {
final String route;

  LoginSuccess({required this.route});

}

class LoginFailure extends LoginCubitStates {
  final String message;

  LoginFailure(this.message);
}

class LoginLoading extends LoginCubitStates {
  final String asset;
  final String title;
  final String message;

  LoginLoading({required this.asset, this.title = "", this.message = ""});
}
