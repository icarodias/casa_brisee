class Product {
  int id;
  String name;
  int amount;
  double price;
  String pathImage;

  Product({
    required this.id,
    required this.name,
    required this.amount,
    required this.price,
    required this.pathImage,
  });

  String toString() =>
      'Product{id:$id, name:$name, amount:$amount, price:$price, pathImage:$pathImage}';

  Map<String, dynamic> toMap() =>
      {"name": name, "amount": amount, "price": price, "pathImage": pathImage};
}
