class DeliveryOrderEntity {
  String client;
  String type;
  String weight;
  int quantity;
  String description;
  String status;
  String orderId;

  DeliveryOrderEntity({
    required this.client,
    required this.type,
    required this.status,
    required this.weight,
    required this.quantity,
    required this.description,
    required this.orderId,
  });
}
