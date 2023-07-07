import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/entities/current_user.dart';
import '../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../core/presentation/widgets/other/access_listener.dart';
import '../../auth/presentation/bloc/auth_bloc.dart';
import '../cubit/home_cubit.dart';
import '../widgets/admin_ui.dart';
import '../widgets/guest_ui.dart';
import '../widgets/user_ui.dart';

class HomePage extends StatelessWidget {
  static const String path = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthLoading =
        context.select<AuthBloc, bool>((bloc) => bloc.state.isLoading);
    return AccessListener(
      child: StackLoading(
        isLoading: isAuthLoading,
        child: BlocProvider(
          create: (_) => HomeCubit(),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final CurrentUser? user = state.user;
              if (user != null) {
                if (user.isAdmin) {
                  return const AdminUI();
                }
                return const UserUI();
              }
              return const GuestUI();
            },
          ),
        ),
      ),
    );
  }
}
