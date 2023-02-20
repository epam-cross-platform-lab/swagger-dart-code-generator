class Order {
  final String id;

  const Order(this.id);

  static const fromJsonFactory = _orderFromJson;

  static Order _orderFromJson(Map<String, dynamic> json) => Order('');
}
