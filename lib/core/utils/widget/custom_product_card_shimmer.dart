import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomProductCardShimmer extends StatelessWidget {
  const CustomProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 2),
      interval: const Duration(seconds: 1),
      color: Colors.grey.shade300,
      colorOpacity: 0.4,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة المنتج
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(height: 8),
              // اسم المنتج
              Container(
                height: 16,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 8),
              // السعر
              Container(height: 20, width: 80, color: Colors.grey.shade300),
            ],
          ),
          // أيقونة المفضلة
          const Positioned(
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(radius: 14, backgroundColor: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
