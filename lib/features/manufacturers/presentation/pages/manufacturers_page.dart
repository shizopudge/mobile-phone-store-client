import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_store/core/domain/entities/manufacturer.dart';

import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/pages/products_page.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/manufacturers_bloc.dart';

class ManufacturersPage extends StatelessWidget {
  const ManufacturersPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<ManufacturersBloc, ManufacturersState>(
      builder: (context, state) {
        return ListPage<ManufacturersBloc, ManufacturersEvent,
            ManufacturersState>(
          onSearch: (query) => context.read<ManufacturersBloc>().add(
                ManufacturersEvent.searchManufacturers(
                  query,
                ),
              ),
          onPagination: () => context
              .read<ManufacturersBloc>()
              .add(const ManufacturersEvent.getNextManufacturers()),
          onFilterTap: null,
          onRefresh: () => context.read<ManufacturersBloc>().add(
                const ManufacturersEvent.refresh(),
              ),
          listener: BlocListener(
            listenWhen: (previous, current) => current.isFailure,
            listener: (context, state) {
              if (state.isFailure) {
                PopupUtils.showFailureSnackBar(
                    context: context, failure: state.failure);
              }
            },
          ),
          query: state.filter.query,
          searchInfo: state.info,
          isFilterActive: state.isFilterActive,
          isRefreshing: state.isRefreshing,
          isPaginating: state.isPaginating,
          isLoading: state.isLoading,
          isLastPage: state.isLastPage,
          isNothingFound: state.isNothingFound,
          child: SizeConfig.isMobile
              ? SliverList.builder(
                  itemCount: state.manufacturers.length,
                  itemBuilder: (context, index) {
                    final Manufacturer manufacturer =
                        state.manufacturers[index];
                    return FadeAnimationX(
                      delay: index * .025,
                      child: Text(
                        manufacturer.name,
                        style: kBold.copyWith(
                          color: kDarkBlue,
                          fontSize: 50,
                        ),
                      ),
                    );
                  },
                )
              : SliverGridView<Manufacturer>(
                  items: state.manufacturers,
                  child: (product, index) => FadeAnimationX(
                    delay: index * .025,
                    child: Text(
                      state.manufacturers[index].name,
                      style: kBold.copyWith(
                        color: kDarkBlue,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
