// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductIdModel _$ProductIdModelFromJson(Map<String, dynamic> json) =>
    ProductIdModel(
      id: json['id'] as String,
      productCode: json['productCode'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      nameArabic: json['nameArabic'] as String,
      descriptionArabic: json['descriptionArabic'] as String,
      coverPictureUrl: json['coverPictureUrl'] as String,
      productPictures: (json['productPictures'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: (json['price'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      color: json['color'] as String,
      discountPercentage: (json['discountPercentage'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      sellerId: json['sellerId'] as String,
    );

Map<String, dynamic> _$ProductIdModelToJson(ProductIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productCode': instance.productCode,
      'name': instance.name,
      'description': instance.description,
      'nameArabic': instance.nameArabic,
      'descriptionArabic': instance.descriptionArabic,
      'coverPictureUrl': instance.coverPictureUrl,
      'productPictures': instance.productPictures,
      'categories': instance.categories,
      'price': instance.price,
      'stock': instance.stock,
      'weight': instance.weight,
      'color': instance.color,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'sellerId': instance.sellerId,
    };
