// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// class Product {
//   final int page;
//   final int size;
//   final int total;
//   final List<Item> items;

//   Product({
//     required this.page,
//     required this.size,
//     required this.total,
//     required this.items,
//   });

//   Product copyWith({
//     int? page,
//     int? size,
//     int? total,
//     List<Item>? items,
//   }) {
//     return Product(
//       page: page ?? this.page,
//       size: size ?? this.size,
//       total: total ?? this.total,
//       items: items ?? this.items,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'page': page,
//       'size': size,
//       'total': total,
//       'items': items.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       page: map['page'] as int,
//       size: map['size'] as int,
//       total: map['total'] as int,
//       items: List<Item>.from(
//         (map['items'] as List<dynamic>).map<Item>(
//           (x) => Item.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Product.fromJson(String source) =>
//       Product.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// class Item {
//   final String name;
//   final String? description;
//   final String unique_id;
//   final List<Photo> photos;

//   Item(
//       {required this.name,
//       required this.description,
//       required this.unique_id,
//       required this.photos});

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'description': description,
//       'unique_id': unique_id,
//       'photos': photos.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//       name: map['name'] as String,
//       description:
//           map['description'] != null ? map['description'] as String : null,
//       unique_id: map['unique_id'] as String,
//       photos: List<Photo>.from(
//         (map['photos'] as List<dynamic>).map<Photo>(
//           (x) => Photo.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Item.fromJson(String source) =>
//       Item.fromMap(json.decode(source) as Map<String, dynamic>);

//   String getFullImageUrl(String baseUrl) {
//     if (photos.isNotEmpty) {

//       return '$baseUrl${photos.first.url}';
//     } else {
//       return '';
//     }
//   }
// }

// class Photo {
//   final String filename;
//   final String url;

//   Photo({required this.filename, required this.url});

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'filename': filename,
//       'url': url,
//     };
//   }

//   factory Photo.fromMap(Map<String, dynamic> map) {
//     return Photo(
//       filename: map['filename'] as String,
//       url: map['url'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Photo.fromJson(String source) =>
//       Photo.fromMap(json.decode(source) as Map<String, dynamic>);
// }

//ok

class Product {
  final int page;
  final int size;
  final int total;
  final dynamic debug;
  final dynamic previousPage;
  final dynamic nextPage;
  final List<Item> items;

  Product({
    required this.page,
    required this.size,
    required this.total,
    this.debug,
    this.previousPage,
    this.nextPage,
    required this.items,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      page: json['page'],
      size: json['size'],
      total: json['total'],
      debug: json['debug'],
      previousPage: json['previous_page'],
      nextPage: json['next_page'],
      items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    );
  }
}

class Item {
  final String name;
  final String? description;
  final String uniqueId;
  final String urlSlug;
  final bool isAvailable;
  final bool isService;
  final dynamic previousUrlSlugs;
  final bool unavailable;
  final dynamic unavailableStart;
  final dynamic unavailableEnd;
  final String id;
  final dynamic parentProductId;
  final dynamic parent;
  final String organizationId;
  final List<dynamic> productImage;
  final List<dynamic> categories;
  final String dateCreated;
  final String lastUpdated;
  final String userId;
  final List<Photo> photos;
  final List<Price> currentPrice;
  final bool isDeleted;
  final double availableQuantity;
  final dynamic sellingPrice;
  final dynamic discountedPrice;
  final dynamic buyingPrice;
  final dynamic extraInfos;

  Item({
    required this.name,
    this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.isAvailable,
    required this.isService,
    this.previousUrlSlugs,
    required this.unavailable,
    this.unavailableStart,
    this.unavailableEnd,
    required this.id,
    this.parentProductId,
    this.parent,
    required this.organizationId,
    required this.productImage,
    required this.categories,
    required this.dateCreated,
    required this.lastUpdated,
    required this.userId,
    required this.photos,
    required this.currentPrice,
    required this.isDeleted,
    required this.availableQuantity,
    this.sellingPrice,
    this.discountedPrice,
    this.buyingPrice,
    this.extraInfos,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      description: json['description'],
      uniqueId: json['unique_id'],
      urlSlug: json['url_slug'],
      isAvailable: json['is_available'],
      isService: json['is_service'],
      previousUrlSlugs: json['previous_url_slugs'],
      unavailable: json['unavailable'],
      unavailableStart: json['unavailable_start'],
      unavailableEnd: json['unavailable_end'],
      id: json['id'],
      parentProductId: json['parent_product_id'],
      parent: json['parent'],
      organizationId: json['organization_id'],
      productImage: List<dynamic>.from(json['product_image']),
      categories: List<dynamic>.from(json['categories']),
      dateCreated: json['date_created'],
      lastUpdated: json['last_updated'],
      userId: json['user_id'],
      photos: List<Photo>.from(json['photos'].map((x) => Photo.fromJson(x))),
      currentPrice:
          List<Price>.from(json['current_price'].map((x) => Price.fromJson(x))),
      isDeleted: json['is_deleted'],
      availableQuantity: json['available_quantity'].toDouble(),
      sellingPrice: json['selling_price'],
      discountedPrice: json['discounted_price'],
      buyingPrice: json['buying_price'],
      extraInfos: json['extra_infos'],
    );
  }
  String getFullImageUrl(String baseUrl) {
    if (photos.isNotEmpty) {
      return '$baseUrl${photos.first.url}';
    } else {
      return '';
    }
  }
}

class Photo {
  final String modelName;
  final String modelId;
  final String organizationId;
  final String filename;
  final String url;
  final bool isFeatured;
  final bool saveAsJpg;
  final bool isPublic;
  final bool fileRename;
  final int position;

  Photo({
    required this.modelName,
    required this.modelId,
    required this.organizationId,
    required this.filename,
    required this.url,
    required this.isFeatured,
    required this.saveAsJpg,
    required this.isPublic,
    required this.fileRename,
    required this.position,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      modelName: json['model_name'],
      modelId: json['model_id'],
      organizationId: json['organization_id'],
      filename: json['filename'],
      url: json['url'],
      isFeatured: json['is_featured'],
      saveAsJpg: json['save_as_jpg'],
      isPublic: json['is_public'],
      fileRename: json['file_rename'],
      position: json['position'],
    );
  }
}

class Price {
  final Map<String, List<dynamic>> currency;

  Price({
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      currency: {'NGN': List<dynamic>.from(json['NGN'])},
    );
  }
}
