class UserModel {
  bool isDeliveryApproved;
  List? tripPeriod;
  String userId;
  String userName;
  String email;
  String phoneNumber;
  String role;
  bool isEmailConfirmed;

  UserModel(
      {required this.isDeliveryApproved,
       this.tripPeriod,
      required this.userId,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.role,
      required this.isEmailConfirmed});
}
