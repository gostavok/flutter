import 'dart:convert';

class OrderPix {
  String image;
  String codigo;
  double totalValue;

  OrderPix({
    required this.image,
    required this.codigo,
    required this.totalValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'codigo': codigo,
      'totalValue': totalValue,
    };
  }

  factory OrderPix.fromMap(Map<String, dynamic> map) {
    return OrderPix(
      image: map['image'] ?? '',
      codigo: map['codigo'] ?? '',
      totalValue: map['totalValue']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderPix.fromJson(String source) =>
      OrderPix.fromMap(json.decode(source));

  OrderPix copyWith({
    String? image,
    String? codigo,
    double? totalValue,
  }) {
    return OrderPix(
      image: image ?? this.image,
      codigo: codigo ?? this.codigo,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}
