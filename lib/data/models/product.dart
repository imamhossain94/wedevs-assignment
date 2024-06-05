
class Product {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String shortDescription;
  final String price;
  final String regularPrice;
  final String salePrice;
  final bool featured;
  final String permalink;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.featured,
    required this.permalink,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      shortDescription: json['short_description'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      featured: json['featured'],
      permalink: json['permalink'],
      imageUrl: json['images'][0]['src'],
    );
  }

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}
