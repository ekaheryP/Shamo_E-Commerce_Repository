import 'package:shamo/models/product_model.dart';

class MessageModel {
  String? massage;
  int? userId;
  String? userName;
  String? userImage;
  bool? isFromUser;
  ProductModel? products;
  late DateTime? createdAt;
  late DateTime? updatedAt;

  MessageModel({
    this.massage,
    this.userId,
    this.userName,
    this.userImage,
    this.isFromUser,
    this.products,
    this.createdAt,
    this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    products = json['product'].isEmpty
        ? UninitializedProductModel()
        : ProductModel.fromJson(json['product']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'massage': massage,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'products':
          products is UninitializedProductModel ? {} : products?.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
