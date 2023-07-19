import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/get_it.dart';
import '../create_edit_manufacturer/presentation/bloc/create_edit_manufacturer_bloc.dart';
import '../create_edit_model/presentation/bloc/create_edit_model_bloc.dart';
import '../create_edit_product/presentation/bloc/create_edit_product_bloc.dart';
import '../manufacturers/presentation/bloc/manufacturers_bloc.dart';
import '../manufacturers/presentation/pages/manufacturers_page.dart';
import '../models/presentation/bloc/models_bloc.dart';
import '../models/presentation/pages/models_page.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currPage = ValueNotifier(0);

  void _animateToPage(int page) => _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

  @override
  void dispose() {
    _pageController.dispose();
    _currPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<ManufacturersBloc>()
            ..add(const ManufacturersEvent.initial()),
        ),
        BlocProvider.value(
          value: getIt<ModelsBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CreateEditManufacturerBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CreateEditModelBloc>(),
        ),
        BlocProvider.value(
          value: getIt<CreateEditProductBloc>(),
        ),
      ],
      child: Builder(
        builder: (context) => SafeArea(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) => _currPage.value = page,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ManufacturersPage(
                onSelectManufacturer: (manufacturer) {
                  context.read<ModelsBloc>().add(
                        ModelsEvent.setManufacturer(manufacturer),
                      );
                  _animateToPage(1);
                },
              ),
              ModelsPage(
                goBack: () => _animateToPage(_currPage.value - 1),
                onSelectModel: (model) => context
                    .read<CreateEditModelBloc>()
                    .add(CreateEditModelEvent.setModel(model)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
