import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/data/model/product_model.dart';
import 'package:e_commerce_app/feature/home/ui/view_model/favorites_cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomProductCard extends StatefulWidget {
  final ProductItem product;
  const CustomProductCard({super.key, required this.product});

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  bool _isLoading = false;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final favoritesCubit = context.read<FavoritesCubit>();
    _isFavorite = await favoritesCubit.isFavorite(widget.product.id);
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _toggleFavorite() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final favoritesCubit = context.read<FavoritesCubit>();
    await favoritesCubit.toggleFavorite(widget.product.id);

    // Update local state immediately
    _isFavorite = await favoritesCubit.isFavorite(widget.product.id);

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        // Update favorite status when favorites state changes
        if (state is FavoritesSuccess) {
          bool wasFavorite = _isFavorite;
          _isFavorite = state.favoriteProducts.any(
            (product) => product.id == widget.product.id,
          );
          if (wasFavorite != _isFavorite && mounted) {
            setState(() {});
          }
        }
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: widget.product.coverPictureUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey.shade300, // أو shimmer لو حابب
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    AppImages.proIcon,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.name,
                style: AppStyles.styleRegular15(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$${widget.product.price}',
                style: AppStyles.styleRegular22(context).copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: _toggleFavorite,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : SvgPicture.asset(
                        AppImages.wishIcon,
                        colorFilter: ColorFilter.mode(
                          _isFavorite ? Colors.red : Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
