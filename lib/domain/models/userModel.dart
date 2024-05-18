class UserModel{
bool isDeliveryApproved;
List tripPeriod;
String userId;
String userName;
String email;
String phoneNumber;
String role;
bool isEmailConfirmed;
UserModel(
    this.isDeliveryApproved,
    this.tripPeriod,
    this.userId,
    this.userName,
    this.email,
    this.phoneNumber,
    this.role,
    this.isEmailConfirmed);
}