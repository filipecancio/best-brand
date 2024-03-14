class ProductData {
  final List<Product> products;

  ProductData({required this.products});

  factory ProductData.fromJson(List<dynamic> json) {
    List<Product> productList = json.map((i) => Product.fromJson(i)).toList();

    return ProductData(
      products: productList,
    );
  }
}

class Product {
  final int id;
  final String datetime;
  final Company company;
  final int likes;
  final ProductDetails product;

  Product({required this.id, required this.datetime, required this.company, required this.likes, required this.product});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      datetime: json['datetime'],
      company: Company.fromJson(json['company']),
      likes: json['likes'],
      product: ProductDetails.fromJson(json['product']),
    );
  }
}

class Company {
  final String name;
  final String avatar;

  Company({required this.name, required this.avatar});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}

class ProductDetails {
  final String name;
  final String description;
  final double price;
  final String url;
  final List<Blob> blobs;

  ProductDetails({required this.name, required this.description, required this.price, required this.url, required this.blobs});

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    var list = json['blobs'] as List;
    List<Blob> blobList = list.map((i) => Blob.fromJson(i)).toList();

    return ProductDetails(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      url: json['url'],
      blobs: blobList,
    );
  }
}

class Blob {
  final String type;
  final String file;

  Blob({required this.type, required this.file});

  factory Blob.fromJson(Map<String, dynamic> json) {
    return Blob(
      type: json['type'],
      file: json['file'],
    );
  }
}