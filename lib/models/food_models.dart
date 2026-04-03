class FoodModel {
  String id;
  String name;
  String description;
  double price;
  String image;

  FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory FoodModel.fromFirestore(Map<String, dynamic> data, String id) {
    return FoodModel(
      id: id,
      name: data['name'],
      description: data['description'],
      price: (data['price']).toDouble(),
      image: data['image'],
    );
  }
}