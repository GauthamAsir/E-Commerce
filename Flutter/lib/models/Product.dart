import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name, description;
  final List<String> images;
  final List<Color>? colors;
  final double price;
  final bool? isFavourite;
  final bool isDeleted;
  final int availableQuantity, addedBy;
  final int? lastModifiedBy;
  final DateTime lastModified, addedOn;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.images,
      this.colors,
      required this.price,
      this.isFavourite,
      required this.isDeleted,
      required this.availableQuantity,
      required this.addedBy,
      required this.lastModified,
      required this.addedOn,
      this.lastModifiedBy});

  static Product fromJson(var data) {
    return Product(
        id: data['PorductId'],
        name: data['PorductName'],
        description: data['ProductDescription'],
        images: [data['ProductImage']],
        price: data['ProductPrice'],
        isDeleted: data['isDeleted'],
        availableQuantity: data['ProductQuantity'],
        addedBy: data['AddedBy'],
        lastModified: DateTime.parse(data['LastModified']),
        lastModifiedBy: data['LastModifiedBy'],
        addedOn: DateTime.parse(data['AddedOn']),
        isFavourite: data['isFavourite'] ?? false);
  }
}

// Our demo Products

// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/glap.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     title: "Logitech Head",
//     price: 20.20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
// ];

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
