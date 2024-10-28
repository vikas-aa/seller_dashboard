import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "brand")
  String? brand;

  @JsonKey(name: "offers")
  bool? offers;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.offers,
    this.price,
    this.brand,
  });

  // Factory method to create a Product object from JSON
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  // Method to convert a Product object to JSON
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
