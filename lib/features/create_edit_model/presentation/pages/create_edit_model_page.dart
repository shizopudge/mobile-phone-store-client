import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../../core/presentation/widgets/other/access_listener.dart';
import '../../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/create_edit_model_bloc.dart';
import '../widgets/create_edit_model_body.dart';

class CreateEditModelPage extends StatefulWidget {
  static const String path = '/create-edit-model';
  const CreateEditModelPage({super.key});

  @override
  State<CreateEditModelPage> createState() => _CreateEditModelPageState();
}

class _CreateEditModelPageState extends State<CreateEditModelPage> {
  late final TextEditingController _nameController = TextEditingController(
      text: context.read<CreateEditModelBloc>().state.model?.name ?? '')
    ..addListener(_nameListener);
  late final TextEditingController _descriptionController =
      TextEditingController(
          text: context.read<CreateEditModelBloc>().state.model?.description ??
              '')
        ..addListener(_descriptionListener);
  late final TextEditingController _pixelDensityController =
      TextEditingController(
          text: context
                  .read<CreateEditModelBloc>()
                  .state
                  .model
                  ?.pixelDensity
                  .toString() ??
              '')
        ..addListener(_pixelDensityListener);
  late final TextEditingController _screenRefreshRateController =
      TextEditingController(
          text: context
                  .read<CreateEditModelBloc>()
                  .state
                  .model
                  ?.screenRefreshRate
                  .toString() ??
              '')
        ..addListener(_screenRefreshRateListener);
  late final TextEditingController _screenDiagonalController =
      TextEditingController(
          text: context
                  .read<CreateEditModelBloc>()
                  .state
                  .model
                  ?.screenDiagonal
                  .toString() ??
              '')
        ..addListener(_screenDiagonalListener);
  late final TextEditingController _weightController = TextEditingController(
      text:
          context.read<CreateEditModelBloc>().state.model?.weight.toString() ??
              '')
    ..addListener(_weightListener);
  late final TextEditingController _widthController = TextEditingController(
      text: context
              .read<CreateEditModelBloc>()
              .state
              .model
              ?.screenWidth
              .toString() ??
          '')
    ..addListener(_widthListener);
  late final TextEditingController _heightController = TextEditingController(
      text: context
              .read<CreateEditModelBloc>()
              .state
              .model
              ?.screenHeight
              .toString() ??
          '')
    ..addListener(_heightListener);

  void _nameListener() => context
      .read<CreateEditModelBloc>()
      .add(CreateEditModelEvent.changeName(_nameController.text.trim()));

  void _descriptionListener() => context.read<CreateEditModelBloc>().add(
      CreateEditModelEvent.changeDescription(
          _descriptionController.text.trim()));

  void _weightListener() =>
      context.read<CreateEditModelBloc>().add(CreateEditModelEvent.changeWeight(
          int.tryParse(_weightController.text.trim()) ?? 0));

  void _screenDiagonalListener() => context.read<CreateEditModelBloc>().add(
      CreateEditModelEvent.changeScreenDiagonal(
          double.tryParse(_screenDiagonalController.text.trim()) ?? 0.0));

  void _screenRefreshRateListener() => context.read<CreateEditModelBloc>().add(
      CreateEditModelEvent.changeScreenRefreshRate(
          int.tryParse(_screenRefreshRateController.text.trim()) ?? 0));

  void _pixelDensityListener() => context.read<CreateEditModelBloc>().add(
      CreateEditModelEvent.changePixelDensity(
          int.tryParse(_pixelDensityController.text.trim()) ?? 0));

  void _widthListener() => context.read<CreateEditModelBloc>().add(
      CreateEditModelEvent.changeScreenResolution(
          '${_widthController.text.trim()}x${_heightController.text.trim()}'));

  void _heightListener() => context.read<CreateEditModelBloc>().add(
      CreateEditModelEvent.changeScreenResolution(
          '${_widthController.text.trim()}x${_heightController.text.trim()}'));

  @override
  void deactivate() {
    context.read<CreateEditModelBloc>().add(const CreateEditModelEvent.reset());
    super.deactivate();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _pixelDensityController.dispose();
    _screenRefreshRateController.dispose();
    _screenDiagonalController.dispose();
    _weightController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AccessListener(
      child: WillPopScope(
        onWillPop: () async {
          context
              .read<CreateEditModelBloc>()
              .add(const CreateEditModelEvent.reset());
          return true;
        },
        child: BlocConsumer<CreateEditModelBloc, CreateEditModelState>(
          listenWhen: (previous, current) =>
              current.status.isSuccess || current.status.isFailure,
          listener: (context, state) => state.callWhen(
            success: () => Navigator.of(context).pop(),
            failure: () => state.failure.call(context),
          ),
          builder: (context, state) {
            return StackLoading(
              isLoading: state.isLoading,
              child: Scaffold(
                  backgroundColor: kWhite,
                  appBar: CasualAppBar(
                    title: state.model != null ? 'Edit Model' : 'Create Model',
                    canGoBack: true,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: CreateEditModelBody(
                          nameController: _nameController,
                          descriptionController: _descriptionController,
                          pixelDensityController: _pixelDensityController,
                          screenRefreshRateController:
                              _screenRefreshRateController,
                          screenDiagonalController: _screenDiagonalController,
                          weightController: _weightController,
                          widthController: _widthController,
                          heightController: _heightController,
                        ),
                      ),
                      CasualButton(
                        onTap: () {
                          if (state.model != null) {
                            context
                                .read<CreateEditModelBloc>()
                                .add(const CreateEditModelEvent.editModel());
                          } else {
                            context
                                .read<CreateEditModelBloc>()
                                .add(const CreateEditModelEvent.createModel());
                          }
                        },
                        text: state.model != null ? 'Edit' : 'Create',
                        isEnabled: state.isAvailable,
                        fontSize: SizeConfig.h3,
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
