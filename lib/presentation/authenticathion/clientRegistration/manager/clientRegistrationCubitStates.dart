abstract class ClientRegistrationCubitStates {}

class ClientRegistrationInitial extends ClientRegistrationCubitStates {}

class ClientRegistrationSuccess extends ClientRegistrationCubitStates {
  final String route;

  ClientRegistrationSuccess({required this.route});
}

class ClientRegistrationFailure extends ClientRegistrationCubitStates {
  final String message;

  ClientRegistrationFailure(this.message);
}

class ClientRegistrationLoading extends ClientRegistrationCubitStates {
  final String asset;
  final String title;
  final String message;

  ClientRegistrationLoading(
      {required this.asset, this.title = "", this.message = ""});
}
