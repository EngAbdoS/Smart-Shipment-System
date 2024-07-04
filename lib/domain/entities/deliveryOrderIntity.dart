class DeliveryOrderEntity {
  String reciptiontName;
  String reciptiontPhone;
  String type;
  String weight;
  int quantity;
  String description;
  String status;
  String orderId;

  DeliveryOrderEntity({
    required this.reciptiontName,
    required this.reciptiontPhone,
    required this.type,
    required this.status,
    required this.weight,
    required this.quantity,
    required this.description,
    required this.orderId,
  });
}
