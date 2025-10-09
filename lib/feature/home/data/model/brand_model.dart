import 'package:e_commerce_app/core/utils/app_images.dart';

class BrandModel {
  final String name;
  final String image;

  BrandModel({required this.name, required this.image});
}

final List<BrandModel> brands = [
  BrandModel(name: 'Adidas', image: AppImages.adidasIcon),
  BrandModel(name: 'Nike', image: AppImages.nikeIcon),
  BrandModel(name: 'Fila', image: AppImages.filaIcon),
  BrandModel(name: 'Puma', image: AppImages.pumaIcon),
  BrandModel(name: 'Adidas', image: AppImages.adidasIcon),
  BrandModel(name: 'Nike', image: AppImages.nikeIcon),
];
