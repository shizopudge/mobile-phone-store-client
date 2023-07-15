import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/model.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/cards/model_card.dart';
import '../../../../core/presentation/widgets/dialogs/actions_dialog.dart';
import '../../../../core/presentation/widgets/other/casual_dismissible.dart';
import '../../../../core/presentation/widgets/pages/browse_page.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../create_edit_model/presentation/bloc/create_edit_model_bloc.dart';
import '../../../create_edit_model/presentation/pages/create_edit_model_page.dart';
import '../../../create_edit_product/presentation/bloc/create_edit_product_bloc.dart';
import '../../../create_edit_product/presentation/pages/create_edit_product_page.dart';
import '../bloc/models_bloc.dart';

class ModelsPage extends StatefulWidget {
  final void Function(Model model) onSelectModel;
  final VoidCallback goBack;
  const ModelsPage({
    super.key,
    required this.goBack,
    required this.onSelectModel,
  });

  @override
  State<ModelsPage> createState() => _ModelsPageState();
}

class _ModelsPageState extends State<ModelsPage> {
  @override
  void initState() {
    context.read<ModelsBloc>().add(const ModelsEvent.initial());
    super.initState();
  }

  void _onLongPress({
    required BuildContext context,
    required Model model,
  }) =>
      showDialog(
        context: context,
        builder: (dialogContext) => ActionsDialog(
          title: 'Model actions',
          subtitle: 'What you want to do with model?',
          actions: [
            CasualButton(
              text: 'Edit model',
              onTap: () {
                context.read<CreateEditModelBloc>().add(
                      CreateEditModelEvent.setModel(
                        model,
                      ),
                    );
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kDarkBlue,
              fontSize: SizeConfig.body2,
            ),
            CasualButton(
              text: 'Delete model',
              onTap: () {
                context.read<ModelsBloc>().add(ModelsEvent.deleteModel(model));
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kRed,
              fontSize: SizeConfig.body2,
            ),
          ],
        ),
      );

  @override
  void deactivate() {
    context.read<ModelsBloc>().add(const ModelsEvent.reset());
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async {
        widget.goBack();
        context.read<ModelsBloc>().add(const ModelsEvent.reset());
        return false;
      },
      child: BlocConsumer<ModelsBloc, ModelsState>(
        listenWhen: (previous, current) => current.isFailure,
        listener: (context, state) {
          if (state.isFailure) {
            state.failure.call(context);
          }
        },
        builder: (context, state) => SafeArea(
          child: BrowsePage<ModelsBloc, ModelsEvent, ModelsState>(
            onSearch: (query) => context.read<ModelsBloc>().add(
                  ModelsEvent.searchModels(
                    query,
                  ),
                ),
            onPagination: () => context
                .read<ModelsBloc>()
                .add(const ModelsEvent.getNextModels()),
            onFilterTap: null,
            onRefresh: () => context.read<ModelsBloc>().add(
                  const ModelsEvent.refresh(),
                ),
            listeners: [
              BlocListener<CreateEditModelBloc, CreateEditModelState>(
                listenWhen: (previous, current) =>
                    current.model != null || current.manufacturerId != null,
                listener: (context, state) {
                  if (state.manufacturerId != null &&
                      ModalRoute.of(context)?.isCurrent == true) {
                    Navigator.of(context).pushNamed(CreateEditModelPage.path);
                  }
                  if (state.model != null &&
                      ModalRoute.of(context)?.isCurrent == true) {
                    Navigator.of(context).pushNamed(CreateEditModelPage.path);
                  }
                },
              ),
              BlocListener<CreateEditProductBloc, CreateEditProductState>(
                listenWhen: (previous, current) => current.modelId != null,
                listener: (context, state) {
                  if (state.modelId != null &&
                      ModalRoute.of(context)?.isCurrent == true) {
                    Navigator.of(context).pushNamed(CreateEditProductPage.path);
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
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimationYDown(
                  delay: .15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.goBack();
                          context
                              .read<ModelsBloc>()
                              .add(const ModelsEvent.reset());
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: kDarkBlue,
                          size: SizeConfig.iconLarge,
                        ),
                      ),
                      IconButton(
                        onPressed: () => context
                            .read<CreateEditModelBloc>()
                            .add(CreateEditModelEvent.setManufacturerId(
                                state.manufacturer?.id ?? '')),
                        tooltip: 'Add',
                        icon: Icon(
                          Icons.add_rounded,
                          color: kDarkBlue,
                          size: SizeConfig.iconLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                FadeAnimationYDown(
                  delay: .25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.manufacturer?.name ?? ''}\nModels',
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
              ],
            ),
            child: SliverList.builder(
              itemCount: state.models.length,
              itemBuilder: (context, index) {
                final Model model = state.models[index];
                return FadeAnimationX(
                  delay: index * .025,
                  child: CasualDismissible(
                    onDismiss: (direction) => context
                        .read<ModelsBloc>()
                        .add(ModelsEvent.deleteModel(model)),
                    label: 'Delete',
                    child: GestureDetector(
                      onTap: () => context
                          .read<CreateEditProductBloc>()
                          .add(CreateEditProductEvent.setModelId(model.id)),
                      onLongPress: () =>
                          _onLongPress(context: context, model: model),
                      child: ModelCard(
                        model: model,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
