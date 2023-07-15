import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/manufacturer.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/cards/manufacturer_card.dart';
import '../../../../core/presentation/widgets/dialogs/actions_dialog.dart';
import '../../../../core/presentation/widgets/pages/browse_page.dart';
import '../../../../core/presentation/widgets/scrollable/sliver_grid_view.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../create_edit_manufacturer/presentation/bloc/create_edit_manufacturer_bloc.dart';
import '../../../create_edit_manufacturer/presentation/pages/create_edit_manufacturer_page.dart';
import '../bloc/manufacturers_bloc.dart';

class ManufacturersPage extends StatelessWidget {
  final void Function(Manufacturer manufacturer) onSelectManufacturer;
  const ManufacturersPage({
    super.key,
    required this.onSelectManufacturer,
  });

  static void _onLongPress({
    required BuildContext context,
    required Manufacturer manufacturer,
  }) =>
      showDialog(
        context: context,
        builder: (dialogContext) => ActionsDialog(
          title: 'Manufacturer actions',
          subtitle: 'What you want to do with manufacturer?',
          actions: [
            CasualButton(
              text: 'Edit manufacturer',
              onTap: () {
                context.read<CreateEditManufacturerBloc>().add(
                      CreateEditManufacturerEvent.setManufacturer(
                        manufacturer,
                      ),
                    );
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kDarkBlue,
              fontSize: SizeConfig.body2,
            ),
            CasualButton(
              text: 'Delete manufacturer',
              onTap: () {
                context
                    .read<ManufacturersBloc>()
                    .add(ManufacturersEvent.deleteManufacturer(manufacturer));
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kRed,
              fontSize: SizeConfig.body2,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocConsumer<ManufacturersBloc, ManufacturersState>(
      listenWhen: (previous, current) => current.isFailure,
      listener: (context, state) {
        if (state.isFailure) {
          state.failure.call(context);
        }
      },
      builder: (context, state) {
        return BrowsePage<ManufacturersBloc, ManufacturersEvent,
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
          listeners: [
            BlocListener<CreateEditManufacturerBloc,
                CreateEditManufacturerState>(
              listenWhen: (previous, current) => current.manufacturer != null,
              listener: (context, state) {
                if (state.manufacturer != null &&
                    ModalRoute.of(context)?.isCurrent == true) {
                  Navigator.of(context)
                      .pushNamed(CreateEditManufacturerPage.path);
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
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manufacturers',
                      overflow: TextOverflow.ellipsis,
                      style: kBold.copyWith(
                          color: kDarkBlue, fontSize: SizeConfig.h1),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(8),
                    ),
                    Text(
                      '*Hold to open actions dialog',
                      overflow: TextOverflow.ellipsis,
                      style: kMedium.copyWith(
                          color: kDarkBlue.withOpacity(.75),
                          fontSize: SizeConfig.body3),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  CreateEditManufacturerPage.path,
                ),
                tooltip: 'Add',
                icon: Icon(
                  Icons.add_rounded,
                  color: kDarkBlue,
                  size: SizeConfig.iconLarge,
                ),
              ),
            ],
          ),
          child: SliverGridView<Manufacturer>(
            items: state.manufacturers,
            crossAxisCount: SizeConfig.isMobile
                ? 3
                : SizeConfig.isTablet
                    ? 4
                    : 6,
            child: (manufacturer, index) => FadeAnimationX(
              key: ValueKey(manufacturer.id),
              delay: index * .025,
              child: ManufacturerCard(
                onTap: () => onSelectManufacturer(manufacturer),
                onLongPress: () => _onLongPress(
                  context: context,
                  manufacturer: manufacturer,
                ),
                manufacturer: manufacturer,
              ),
            ),
          ),
        );
      },
    );
  }
}
