import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../domain/entities/product.dart';
import '../widgets/detailed_product_body.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/presentation/widgets/buttons/casual_text_button.dart';
import '../../../../core/presentation/widgets/pages/error_page.dart';
import '../bloc/products_bloc.dart';

class DetailedProduct extends StatelessWidget {
  const DetailedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async {
        context
            .read<ProductsBloc>()
            .add(const ProductsEvent.changeProduct(null));
        return true;
      },
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          final Product? product = state.selectedProduct;
          if (product == null) {
            return FadeAnimationYDown(
              delay: .5,
              child: ErrorPage(
                failure: const UnknownFailure(
                  message: 'Product not found',
                ),
                action: CasualTextButton(
                  onTap: () => Navigator.of(context).pop(),
                  text: 'Go back',
                ),
              ),
            );
          }
          return Scaffold(
            backgroundColor: kLightWhite,
            body: SafeArea(
              child: DetailedProductBody(
                product: product,
              ),
            ),
          );
        },
      ),
    );
  }
}
