
class Product {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String shortDescription;
  final double price;
  final double? regularPrice;
  final String salePrice;
  final bool featured;
  final int ratingCount;
  final int totalSales;
  final String permalink;
  final String imageUrl;
  final DateTime dateModified;

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
    required this.ratingCount,
    required this.totalSales,
    required this.permalink,
    required this.imageUrl,
    required this.dateModified,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      shortDescription: json['short_description'],
      price: double.tryParse(json['price']) ?? 0,
      regularPrice: double.tryParse(json['regular_price']),
      salePrice: json['sale_price'],
      featured: json['featured'],
      ratingCount: json['rating_count'],
      totalSales: json['total_sales'],
      permalink: json['permalink'],
      imageUrl: json['images'][0]['src'],
      dateModified: DateTime.parse(json['date_modified']),
    );
  }

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}
