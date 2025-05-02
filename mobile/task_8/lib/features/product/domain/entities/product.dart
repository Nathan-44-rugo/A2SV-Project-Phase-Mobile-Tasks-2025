import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id, imageUrl, name, description, price];
}
