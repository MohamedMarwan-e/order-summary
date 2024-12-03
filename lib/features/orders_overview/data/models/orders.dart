class Order {
  final String id;
  final double price;
  final String status;
  final bool isActive;
  final String registered;

  Order({
    required this.id,
    required this.price,
    required this.status,
    required this.isActive,
    required this.registered,
  });

  String get date {
    return registered.split('T').first; // Extracts only the date portion (e.g., "2021-04-11")
  }

  factory Order.fromJson(Map<String, dynamic> json) {

    double parsePrice(String price) {
      try {
        String cleanPrice = price.replaceAll("\$", "").replaceAll(",", "");
        return double.parse(cleanPrice);
      } catch (e) {
        throw FormatException("Invalid price format: $price");
      }
    }

    return Order(
      id: json['id'] ,
      price: parsePrice(json['price'] ),
      status: json['status'] ,
      isActive: json['isActive'] ,
      registered: json['registered'] ,
    );
  }
}
