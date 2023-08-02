import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../core/constants/extensions.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/dialogs/actions_dialog.dart';
import '../../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../../core/presentation/widgets/other/access_listener.dart';
import '../../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/create_edit_product_bloc.dart';
import '../widgets/create_edit_product_body.dart';

class CreateEditProductPage extends StatefulWidget {
  static const String path = '/create-edit-product';
  const CreateEditProductPage({super.key});

  @override
  State<CreateEditProductPage> createState() => _CreateEditProductPageState();
}

class _CreateEditProductPageState extends State<CreateEditProductPage> {
  late final TextEditingController _costController = TextEditingController(
      text: context
              .read<CreateEditProductBloc>()
              .state
              .product
              ?.cost
              .toString() ??
          '')
    ..addListener(_costListener);

  late final TextEditingController _colorController = TextEditingController(
      text: context.read<CreateEditProductBloc>().state.color)
    ..addListener(_colorListener);

  late final TextEditingController _storageController = TextEditingController(
      text: context
              .read<CreateEditProductBloc>()
              .state
              .product
              ?.storage
              .toString() ??
          '')
    ..addListener(_storageListener);

  late final TextEditingController _inStockCountController =
      TextEditingController(
          text: context
              .read<CreateEditProductBloc>()
              .state
              .inStockCount
              .toString())
        ..addListener(_inStockListener);

  late final TextEditingController _discountController = TextEditingController(
      text: context.read<CreateEditProductBloc>().state.discount.toString())
    ..addListener(_discountListener);

  void _costListener() => context.read<CreateEditProductBloc>().add(
      CreateEditProductEvent.changeCost(
          double.tryParse(_costController.text.trim()) ?? 0.0));

  void _colorListener() => context
      .read<CreateEditProductBloc>()
      .add(CreateEditProductEvent.changeColor(_colorController.text.trim()));

  void _storageListener() => context.read<CreateEditProductBloc>().add(
      CreateEditProductEvent.changeStorage(
          int.tryParse(_storageController.text.trim()) ?? 0));

  void _inStockListener() => context.read<CreateEditProductBloc>().add(
      CreateEditProductEvent.changeInStockCount(
          int.tryParse(_inStockCountController.text.trim()) ?? 0));

  void _discountListener() => context.read<CreateEditProductBloc>().add(
      CreateEditProductEvent.changeDiscount(
          int.tryParse(_discountController.text.trim()) ?? 0));

  void _onUploadedImageTap({
    required BuildContext context,
    required File image,
  }) =>
      showDialog(
        context: context,
        builder: (dialogContext) => ActionsDialog(
          title: 'Uploaded image actions',
          subtitle: 'What you want to do with image?',
          actions: [
            CasualButton(
              text: 'Remove image',
              onTap: () {
                context
                    .read<CreateEditProductBloc>()
                    .add(CreateEditProductEvent.removePickedImage(image));
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kRed,
              fontSize: SizeConfig.body2,
            ),
          ],
        ),
      );

  void _onImageTap({
    required BuildContext context,
    required String imageLink,
  }) =>
      showDialog(
        context: context,
        builder: (dialogContext) => ActionsDialog(
          title: 'Product image actions',
          subtitle: 'What you want to do with image?',
          actions: [
            CasualButton(
              text: 'Delete image',
              onTap: () {
                context
                    .read<CreateEditProductBloc>()
                    .add(CreateEditProductEvent.deleteImage(imageLink));
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kRed,
              fontSize: SizeConfig.body2,
            ),
          ],
        ),
      );

  void _onColorPickerTap(
    BuildContext context,
  ) =>
      showDialog(
        context: context,
        builder: (dialogContext) => StatefulBuilder(
          builder: (_, setState) {
            final pickerColor = context
                    .watch<CreateEditProductBloc>()
                    .state
                    .colorCode
                    .isNotEmpty
                ? HexColor.fromHex(
                    context.read<CreateEditProductBloc>().state.colorCode)
                : kDarkBlue;
            return ActionsDialog(
              title: 'Color Picker',
              subtitle: 'What color do you want to set?',
              actions: [
                ColorPicker(
                  pickerColor: pickerColor,
                  onColorChanged: (color) {
                    context.read<CreateEditProductBloc>().add(
                        CreateEditProductEvent.changeColorCode(color.toHex()));
                    setState(() {});
                  },
                ),
                ColorPickerInput(
                  pickerColor,
                  (color) {
                    context.read<CreateEditProductBloc>().add(
                        CreateEditProductEvent.changeColorCode(color.toHex()));
                    setState(() {});
                  },
                ),
                CasualButton(
                  text: 'OK',
                  onTap: () => Navigator.of(dialogContext).pop(),
                  fontSize: SizeConfig.body2,
                ),
              ],
            );
          },
        ),
      );

  @override
  void deactivate() {
    context
        .read<CreateEditProductBloc>()
        .add(const CreateEditProductEvent.reset());
    super.deactivate();
  }

  @override
  void dispose() {
    _costController.dispose();
    _storageController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AccessListener(
      child: WillPopScope(
        onWillPop: () async {
          context
              .read<CreateEditProductBloc>()
              .add(const CreateEditProductEvent.reset());
          return true;
        },
        child: BlocConsumer<CreateEditProductBloc, CreateEditProductState>(
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
                  title:
                      state.product != null ? 'Edit product' : 'Create product',
                  canGoBack: true,
                  actions: state.product != null
                      ? [
                          IconButton(
                            onPressed: () => context
                                .read<CreateEditProductBloc>()
                                .add(const CreateEditProductEvent
                                    .deleteProduct()),
                            icon: Icon(
                              Icons.delete_rounded,
                              color: kDarkBlue,
                              size: SizeConfig.iconLarge,
                            ),
                          ),
                        ]
                      : null,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: CreateEditProductBody(
                        onUploadImagesTap: () => context
                            .read<CreateEditProductBloc>()
                            .add(const CreateEditProductEvent.pickImages()),
                        onUploadedImageTap: (File image) =>
                            _onUploadedImageTap(context: context, image: image),
                        onImageTap: (imageLink) =>
                            _onImageTap(context: context, imageLink: imageLink),
                        onColorPickerTap: () => _onColorPickerTap(context),
                        costController: _costController,
                        storageController: _storageController,
                        colorController: _colorController,
                        inStockCountController: _inStockCountController,
                        discountController: _discountController,
                      ),
                    ),
                    CasualButton(
                      onTap: () {
                        if (state.product != null) {
                          context
                              .read<CreateEditProductBloc>()
                              .add(const CreateEditProductEvent.editProduct());
                        } else {
                          context.read<CreateEditProductBloc>().add(
                              const CreateEditProductEvent.createProduct());
                        }
                      },
                      text: state.product != null ? 'Edit' : 'Create',
                      isEnabled: state.isAvailable,
                      fontSize: SizeConfig.h3,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
