import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/casual_text_button.dart';
import '../../../../core/presentation/widgets/loading/casual_loader.dart';
import '../../../../core/presentation/widgets/pages/error_page.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/detailed_product_bloc.dart';
import '../widgets/detailed_product_body.dart';
import '../widgets/detailed_product_bottom.dart';
import '../widgets/detailed_product_header.dart';

class DetailedProductPage extends StatefulWidget {
  static const String path = '/detailed-product';
  const DetailedProductPage({super.key});

  @override
  State<DetailedProductPage> createState() => _DetailedProductPageState();
}

class _DetailedProductPageState extends State<DetailedProductPage> {
  late final ScrollController _scrollController = ScrollController()
    ..addListener(_scrollListener);
  late final ValueNotifier<bool> _showInfo = ValueNotifier<bool>(false);

  void _scrollListener() {
    if (SizeConfig.screenHeight! > 2000) {
      _showInfo.value = !_showInfo.value;
    } else {
      if (_scrollController.position.pixels > 0) {
        _showInfo.value = true;
      } else {
        _showInfo.value = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _showInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async {
        context
            .read<DetailedProductBloc>()
            .add(const DetailedProductEvent.changeProduct(null));
        return true;
      },
      child: BlocConsumer<DetailedProductBloc, DetailedProductState>(
        listenWhen: (previous, current) => current.isFailure,
        listener: (context, state) {
          PopupUtils.showFailureSnackBar(
              context: context, failure: state.failure);
        },
        builder: (context, state) {
          final Product? product = state.product;
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
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.setPadding(20)),
                        child: DetailedProductHeader(
                          product: product,
                        ),
                      ),
                      if (state.isLoading)
                        const Expanded(
                          child: Center(
                            child: FadeAnimationYDown(
                              delay: .1,
                              child: CasualLoader(
                                color: kDarkBlue,
                              ),
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: _showInfo,
                            builder: (context, showInfo, child) =>
                                RefreshIndicator(
                              onRefresh: () async => context
                                  .read<DetailedProductBloc>()
                                  .add(DetailedProductEvent.getOneProduct(
                                      id: product.id)),
                              child: DetailedProductBody(
                                product: product,
                                scrollController: _scrollController,
                                showInfo: showInfo,
                              ),
                            ),
                          ),
                        ),
                      ValueListenableBuilder(
                        valueListenable: _showInfo,
                        builder: (context, showInfo, _) =>
                            DetailedProductBottom(
                          product: product,
                          showInfo: showInfo,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}