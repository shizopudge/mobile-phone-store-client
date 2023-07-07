import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/extensions.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/loading/casual_loader.dart';
import '../../../../core/presentation/widgets/scrollable/simple_slider.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/fonts.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/entities/product.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/presentation/widgets/buttons/rounded_icon_button.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/products_bloc.dart';

class DetailedProductBody extends StatelessWidget {
  final Product product;
  const DetailedProductBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final CurrentUser? user =
        context.select<AuthBloc, CurrentUser?>((bloc) => bloc.state.user);
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Positioned(
          right: -SizeConfig.screenWidth! * .4,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: kGrey.withOpacity(.2),
                radius: SizeConfig.radiusLarger,
              ),
              if (product.images.isNotEmpty)
                CachedNetworkImage(
                  imageUrl: '${ApiConstants.imagesUrl}/${product.images[0]}',
                  height: SizeConfig.radiusLarger * 1.5,
                  width: SizeConfig.radiusLarger * 1.5,
                  fit: BoxFit.contain,
                  imageBuilder: (context, imageProvider) => Hero(
                    tag: product.id,
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                  placeholder: (context, url) => const CasualLoader(
                    color: kDarkBlue,
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.image,
                    color: kDarkBlue,
                    size: SizeConfig.iconLarger,
                  ),
                )
              else
                Icon(
                  Icons.image,
                  color: kDarkBlue,
                  size: SizeConfig.iconLarger,
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedIconButton(
                    onTap: () => Navigator.of(context).pop([
                      context
                          .read<ProductsBloc>()
                          .add(const ProductsEvent.changeProduct(null))
                    ]),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: kDarkBlue,
                      size: SizeConfig.iconMedium,
                    ),
                  ),
                  if (user != null)
                    RoundedIconButton(
                      onTap: () {},
                      child: Icon(
                        product.isInWishlist(user)
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: kDarkBlue,
                        size: SizeConfig.iconMedium,
                      ),
                    ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.setPadding(20),
                      ),
                      Text(
                        product.title,
                        style: kBold.copyWith(
                          fontSize: SizeConfig.h1,
                          color: kDarkBlue,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.setPadding(20),
                      ),
                      DetailedProductParam(
                        title: product.color,
                        itemCount: product.colors.length,
                        itemBuilder: (context, index) {
                          final String color = product.colors[index];
                          return DetailedProductColor(
                            onTap: () => context.read<ProductsBloc>().add(
                                ProductsEvent.changeProduct(
                                    product.getProductByColor(color))),
                            selectedColor: product.colorCode,
                            color: color,
                          );
                        },
                      ),
                      if (product.images.isNotEmpty)
                        SizedBox(
                          height: SizeConfig.setPadding(20),
                        ),
                      if (product.images.isNotEmpty)
                        DetailedProductParam(
                          title: 'Gallery',
                          itemCount: product.images.length,
                          height: SizeConfig.isMobile
                              ? SizeConfig.screenWidth! * .15
                              : SizeConfig.isTablet
                                  ? SizeConfig.screenWidth! * .12
                                  : SizeConfig.screenWidth! * .08,
                          itemBuilder: (context, index) {
                            final String image = product.images[index];
                            return DetailedProductGalleryImage(
                                onTap: () => showDialog(
                                      context: context,
                                      useSafeArea: true,
                                      builder: (context) => GalleryDialog(
                                        images: product.images,
                                        initPage: index,
                                      ),
                                    ),
                                image: image);
                          },
                        ),
                      SizedBox(
                        height: SizeConfig.setPadding(20),
                      ),
                      Text(
                        'Storage',
                        style: kSemiBold.copyWith(
                          fontSize: SizeConfig.body1,
                          color: kGrey,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.setPadding(8),
                      ),
                      Container(
                        padding: EdgeInsets.all(SizeConfig.setPadding(8)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.borderRadiusSmall),
                          color: kLightWhite,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(
                                .25,
                                1.5,
                              ),
                              color: kGrey.withOpacity(
                                .5,
                              ),
                            ),
                          ],
                        ),
                        child: DropdownButton(
                          value: product.storage,
                          underline: const SizedBox(),
                          borderRadius: BorderRadius.circular(
                              SizeConfig.borderRadiusSmall),
                          icon: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.setPadding(12)),
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: kLightBlue,
                                size: SizeConfig.iconSmall,
                              ),
                            ),
                          ),
                          items: List.generate(
                            product.storages.length,
                            (index) => DropdownMenuItem(
                              value: product.storages[index],
                              child: Text(
                                '${product.storages[index]}GB',
                                style: kSemiBold.copyWith(
                                  color: kDarkBlue,
                                  fontSize: SizeConfig.body1,
                                ),
                              ),
                            ),
                          ),
                          onChanged: (storage) => storage != null
                              ? context.read<ProductsBloc>().add(
                                  ProductsEvent.changeProduct(
                                      product.getProductByStorage(storage)))
                              : null,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.setPadding(20),
                      ),
                      Text(
                        'Description',
                        style: kSemiBold.copyWith(
                          fontSize: SizeConfig.body1,
                          color: kGrey,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.setPadding(8),
                      ),
                      Text(
                        'This example shows the most basic inheritance feature: classes inherit properties and methods from base classes. Here, Dog is a derived class that derives from the Animal base class using the extends keyword. Derived classes are often called subclasses, and base classes are often called superclasses. Because Dog extends the functionality from Animal, we were able to create an instance of Dog that could both bark() and move(). Let’s now look at a more complex example.',
                        style: kRegular.copyWith(
                          fontSize: SizeConfig.body2,
                          color: kDarkBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  RoundedIconButton(
                    onTap: () {},
                    innerPadding: 12,
                    child: Icon(
                      Icons.shopping_bag_rounded,
                      color: kDarkBlue,
                      size: SizeConfig.iconLarge,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.setPadding(8),
                  ),
                  Expanded(
                    child: CasualButton(
                      onTap: () {},
                      borderRadius: SizeConfig.borderRadiusSmall,
                      text: 'Checkout \$${product.cost}',
                      fontSize: SizeConfig.body1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GalleryDialog extends StatelessWidget {
  final List<String> images;
  final int initPage;
  const GalleryDialog({
    super.key,
    required this.images,
    required this.initPage,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        backgroundColor: kLightWhite,
        insetPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.setPadding(30),
            vertical: SizeConfig.setPadding(150)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusSmall,
          ),
        ),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: CloseButton(
                color: kDarkBlue,
              ),
            ),
            Expanded(
              child: SimpleSlider(
                initialPage: initPage,
                itemCount: images.length,
                bottomActiveButtonColor: kBlack,
                itemBuilder: (index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CachedNetworkImage(
                    imageUrl: '${ApiConstants.imagesUrl}/${images[index]}',
                    fit: BoxFit.contain,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.borderRadiusSmall),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: kWhite,
                      highlightColor: kLightWhite,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.borderRadiusSmall),
                          color: kGrey,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.image,
                      color: kDarkBlue,
                      size: SizeConfig.iconLarger,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedProductGalleryImage extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  const DetailedProductGalleryImage({
    super.key,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.setPadding(12)),
      child: AspectRatio(
        aspectRatio: 1 / 1.1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: kLightWhite,
              borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(
                    .25,
                    1.5,
                  ),
                  color: kGrey.withOpacity(
                    .5,
                  ),
                ),
              ],
            ),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.imagesUrl}/$image',
              fit: BoxFit.contain,
              imageBuilder: (context, imageProvider) => Container(
                padding: EdgeInsets.all(SizeConfig.setPadding(6)),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.borderRadiusSmall),
                ),
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: kWhite,
                highlightColor: kLightWhite,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.borderRadiusSmall),
                    color: kGrey,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.image,
                color: kDarkBlue,
                size: SizeConfig.iconMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailedProductParam extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double? height;
  const DetailedProductParam({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kSemiBold.copyWith(
            fontSize: SizeConfig.body1,
            color: kGrey,
          ),
        ),
        SizedBox(
          height: SizeConfig.setPadding(8),
        ),
        SizedBox(
          height: height ??
              (SizeConfig.isMobile
                  ? SizeConfig.screenWidth! * .1
                  : SizeConfig.isTablet
                      ? SizeConfig.screenWidth! * .075
                      : SizeConfig.screenWidth! * .04),
          width: SizeConfig.screenWidth! * .5,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: itemBuilder,
          ),
        ),
      ],
    );
  }
}

class DetailedProductColor extends StatelessWidget {
  final VoidCallback onTap;
  final String selectedColor;
  final String color;
  const DetailedProductColor({
    super.key,
    required this.selectedColor,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.setPadding(2.5)),
        margin: EdgeInsets.only(right: SizeConfig.setPadding(8)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: selectedColor == color
              ? Border.all(
                  color: kDarkBlue.withOpacity(.75),
                  width: 2.5,
                )
              : null,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(
                .25,
                1.5,
              ),
              color: kGrey.withOpacity(
                .5,
              ),
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: HexColor.fromHex(
            color,
          ),
        ),
      ),
    );
  }
}
