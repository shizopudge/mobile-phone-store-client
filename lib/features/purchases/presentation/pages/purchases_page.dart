import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/entities/purchase.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/cards/purchase_card.dart';
import '../../../../core/presentation/widgets/dialogs/actions_dialog.dart';
import '../../../../core/presentation/widgets/other/casual_dropdown_menu.dart';
import '../../../../core/presentation/widgets/pages/browse_page.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../../detailed_product/presentation/pages/detailed_product_page.dart';
import '../bloc/purchases_bloc.dart';

class PurchasesPage extends StatefulWidget {
  const PurchasesPage({
    super.key,
  });

  static const String path = '/purchases-page';

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  final ValueNotifier<PurchaseStatus> _status =
      ValueNotifier(PurchaseStatus.CANCELLED);

  void _onLongPress({
    required BuildContext context,
    required Purchase purchase,
  }) {
    _status.value = purchase.status;
    showDialog(
      context: context,
      builder: (dialogContext) => ActionsDialog(
        title: 'Purchases status',
        subtitle: 'What status do you want to set the purchase?',
        actions: [
          ValueListenableBuilder(
            valueListenable: _status,
            builder: (_, status, __) => Column(
              children: [
                CasualDropdownMenu<PurchaseStatus>(
                  currValue: status,
                  values: List.generate(
                    PurchaseStatus.values.length,
                    (index) => DropdownMenuItem(
                      value: PurchaseStatus.values[index],
                      child: Text(
                        PurchaseStatus.values[index].toString(),
                      ),
                    ),
                  ),
                  onChange: (status) => status != null
                      ? _status.value = status
                      : _status.value = PurchaseStatus.CANCELLED,
                ),
                SizedBox(
                  height: SizeConfig.setPadding(12),
                ),
                CasualButton(
                  text: 'Enter',
                  onTap: () {
                    context.read<PurchasesBloc>().add(
                        PurchasesEvent.changeStatus(
                            purchase: purchase, status: status));
                    Navigator.of(dialogContext).pop();
                  },
                  enabledBgColor: kDarkBlue,
                  fontSize: SizeConfig.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final currentUser =
        context.select<AuthBloc, CurrentUser?>((bloc) => bloc.state.user);
    return BlocConsumer<PurchasesBloc, PurchasesState>(
      listenWhen: (previous, current) => current.isFailure,
      listener: (context, state) {
        if (state.isFailure) {
          state.failure.call(context);
        }
      },
      builder: (context, state) => SafeArea(
        child: BrowsePage<PurchasesBloc, PurchasesEvent, PurchasesState>(
          onSearch: (query) => context.read<PurchasesBloc>().add(
                PurchasesEvent.searchPurchases(
                  query,
                ),
              ),
          onPagination: () => context
              .read<PurchasesBloc>()
              .add(const PurchasesEvent.getNextPurchases()),
          onFilterTap: null,
          onRefresh: () => context.read<PurchasesBloc>().add(
                const PurchasesEvent.refresh(),
              ),
          listeners: [
            BlocListener<DetailedProductBloc, DetailedProductState>(
              listenWhen: (previous, current) => current.product != null,
              listener: (context, state) {
                if (state.product != null &&
                    ModalRoute.of(context)?.isCurrent == true) {
                  primaryFocus?.unfocus();
                  Navigator.of(context).pushNamed(DetailedProductPage.path);
                }
              },
            ),
          ],
          query: state.filter.query,
          searchInfo: state.info,
          isFilterActive: state.isFilterActive,
          isRefreshing: state.isRefreshing,
          isPaginating: state.isPaginating,
          isLoading: state.isLoading,
          isLastPage: state.isLastPage,
          isNothingFound: state.isNothingFound,
          header: FadeAnimationYDown(
            delay: .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (currentUser != null && !currentUser.isAdmin)
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: kDarkBlue,
                      size: SizeConfig.iconLarge,
                    ),
                  ),
                Text(
                  'Purchases',
                  overflow: TextOverflow.ellipsis,
                  style:
                      kBold.copyWith(color: kDarkBlue, fontSize: SizeConfig.h1),
                ),
              ],
            ),
          ),
          child: SliverList.builder(
            itemCount: state.purchases.length,
            itemBuilder: (context, index) {
              final Purchase purchase = state.purchases[index];
              return FadeAnimationX(
                delay: index * .025,
                child: GestureDetector(
                  onTap: currentUser != null && currentUser.isAdmin
                      ? null
                      : () {
                          if (!purchase.status.isCancelled) {
                            context
                                .read<PurchasesBloc>()
                                .add(PurchasesEvent.openUrl(purchase));
                          }
                        },
                  onLongPress: currentUser != null && currentUser.isAdmin
                      ? () => _onLongPress(context: context, purchase: purchase)
                      : null,
                  child: PurchaseCard(
                    purchase: purchase,
                    onCancelTap: () => context
                        .read<PurchasesBloc>()
                        .add(PurchasesEvent.changeStatus(
                          purchase: purchase,
                          status: PurchaseStatus.CANCELLED,
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
