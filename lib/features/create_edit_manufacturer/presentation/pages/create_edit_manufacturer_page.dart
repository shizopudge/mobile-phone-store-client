import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/dialogs/actions_dialog.dart';
import '../../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../../core/presentation/widgets/other/access_listener.dart';
import '../../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/create_edit_manufacturer_bloc.dart';
import '../widgets/create_edit_manufacturer_body.dart';

class CreateEditManufacturerPage extends StatefulWidget {
  static const String path = '/create-edit-manufacturer';
  const CreateEditManufacturerPage({super.key});

  @override
  State<CreateEditManufacturerPage> createState() =>
      _CreateEditManufacturerPageState();
}

class _CreateEditManufacturerPageState
    extends State<CreateEditManufacturerPage> {
  late final TextEditingController _nameController = TextEditingController(
      text: context.read<CreateEditManufacturerBloc>().state.name)
    ..addListener(_nameListener);

  void _nameListener() => context
      .read<CreateEditManufacturerBloc>()
      .add(CreateEditManufacturerEvent.changeName(_nameController.text.trim()));

  void _onImageTap(String? userImage) {
    if (userImage == null) {
      context
          .read<CreateEditManufacturerBloc>()
          .add(const CreateEditManufacturerEvent.pickImage());
    } else {
      showDialog(
        context: context,
        builder: (dialogContext) => ActionsDialog(
          title: 'Image actions',
          subtitle: 'What you want to do with image?',
          actions: [
            CasualButton(
              text: 'Upload image',
              onTap: () {
                context
                    .read<CreateEditManufacturerBloc>()
                    .add(const CreateEditManufacturerEvent.pickImage());
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kDarkBlue,
              fontSize: SizeConfig.body2,
            ),
            CasualButton(
              text: 'Delete image',
              onTap: () {
                context
                    .read<CreateEditManufacturerBloc>()
                    .add(const CreateEditManufacturerEvent.deleteImage());
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kRed,
              fontSize: SizeConfig.body2,
            ),
          ],
        ),
      );
    }
  }

  @override
  void deactivate() {
    context
        .read<CreateEditManufacturerBloc>()
        .add(const CreateEditManufacturerEvent.reset());
    super.deactivate();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AccessListener(
      child: WillPopScope(
        onWillPop: () async {
          context
              .read<CreateEditManufacturerBloc>()
              .add(const CreateEditManufacturerEvent.reset());
          return true;
        },
        child: BlocConsumer<CreateEditManufacturerBloc,
            CreateEditManufacturerState>(
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
                    title: state.manufacturer != null
                        ? 'Edit Manufacturer'
                        : 'Create Manufacturer',
                    canGoBack: true,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: CreateEditManufacturerBody(
                          onImageTap: _onImageTap,
                          nameController: _nameController,
                          currImage: state.manufacturer?.image,
                          pickedImage: state.image,
                        ),
                      ),
                      CasualButton(
                        onTap: () {
                          if (state.manufacturer != null) {
                            context.read<CreateEditManufacturerBloc>().add(
                                const CreateEditManufacturerEvent
                                    .editManufacturer());
                          } else {
                            context.read<CreateEditManufacturerBloc>().add(
                                const CreateEditManufacturerEvent
                                    .createManufacturer());
                          }
                        },
                        text: state.manufacturer != null ? 'Edit' : 'Create',
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
