import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/logic/auth/auth_bloc.dart';
import '../../core/presentation/widgets/loading/stack_loading.dart';
import '../../core/presentation/widgets/other/access_listener.dart';
import '../../core/utils/size_config.dart';
import 'cubit/home_cubit.dart';
import 'widgets/admin_interface.dart';
import 'widgets/guest_interface.dart';
import 'widgets/user_interface.dart';

class HomePage extends StatelessWidget {
  static const String path = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final authState = context.watch<AuthBloc>().state;
    return AccessListener(
      child: StackLoading(
        isLoading: authState.isLoading,
        child: BlocProvider(
          create: (_) => HomeCubit(),
          child: authState.user != null
              ? authState.user!.isAdmin
                  ? const AdminInterface()
                  : const UserInterface()
              : const GuestInterface(),
        ),
      ),
    );
  }
}
