class Product {
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final String imagePath;
  final List<int> availableSizes;

  Product({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.availableSizes,
  });
}
