class Product {
  final String? id;
  final String? title;
  final String? imageUrl;
  final String? description;
  final double? price;
  final String? productCategoryName;
  final String? brand;
  final int? quantity;
  final bool? isFavorit;
  final bool? isPopular;

  Product(
      {this.id,
      this.title,
      this.imageUrl,
      this.description,
      this.price,
      this.productCategoryName,
      this.brand,
      this.quantity,
      this.isFavorit,
      this.isPopular});
}
