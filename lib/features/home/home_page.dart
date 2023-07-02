import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/admin_interface.dart';
import 'widgets/guest_interface.dart';
import 'widgets/user_interface.dart';

import '../../core/domain/entities/current_user.dart';
import '../../core/logic/auth/auth_bloc.dart';
import '../../core/presentation/widgets/access_listener.dart';
import '../../core/presentation/widgets/buttons/casual_text_button.dart';
import '../../core/presentation/widgets/pages/error_page.dart';
import '../../core/presentation/widgets/stack_loading.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  static const String path = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthBloc>().state.isLoading;
    return AccessListener(
      child: StackLoading(
        isLoading: isLoading,
        child: BlocProvider(
          create: (_) => HomeCubit(),
          child: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) => !current.isUnauthorized,
            builder: (context, state) {
              final CurrentUser? user = state.user;
              if (user != null) {
                if (user.isAdmin) {
                  return const AdminInterface();
                }
                return const UserInterface();
              } else if (state.isGuest) {
                return const GuestInterface();
              }
              return ErrorPage(
                action: CasualTextButton(
                  onTap: () {
                    //TODO! СБРАСЫВАТь СТЕЙТ ВСЕГО ПРИЛОЖЕНИЯ И ЧИСТИТЬ ВЕСЬ КЕШ
                  },
                  text: 'Reload app',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
