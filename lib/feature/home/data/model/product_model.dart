import 'package:e_commerce_app/core/utils/app_images.dart';

class ProductModel {
  final String name;
  final String image;
  final double price;

  ProductModel({required this.name, required this.image, required this.price});
}

final products = [
  ProductModel(
    name: 'Nike Sportswear Club Fleece',
    image: AppImages.proIcon,
    price: 99.0,
  ),
  ProductModel(
    name: 'Trail Running Jacket Nike Windrunner',
    image: AppImages.pro6Icon,
    price: 120.0,
  ),
  ProductModel(
    name: 'Training Top Nike Sport Clash',
    image: AppImages.pro4Icon,
    price: 20.0,
  ),
  ProductModel(
    name: 'Trail Running Jacket Nike Windrunner',
    image: AppImages.pro2Icon,
    price: 100.0,
  ),
  ProductModel(
    name: 'Nike Sportswear Club Fleece',
    image: AppImages.pro5Icon,
    price: 99.0,
  ),
  ProductModel(
    name: 'Trail Running Jacket Nike Windrunner',
    image: AppImages.pro6Icon,
    price: 120.0,
  ),
  ProductModel(
    name: 'Training Top Nike Sport Clash',
    image: AppImages.pro4Icon,
    price: 20.0,
  ),
  ProductModel(
    name: 'Trail Running Jacket Nike Windrunner',
    image: AppImages.pro3Icon,
    price: 100.0,
  ),
];
