import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/user_image.dart';
import '../../../../core/styles/styles.dart';
import '../../../auth/domain/entities/current_user.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../profile_edit/presentation/profile_edit_page.dart';
import 'profile_list_tile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.currentUser,
  });

  final CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              if (currentUser.image != null)
                Hero(
                    tag: 'user_image',
                    child: UserImage(image: currentUser.image, radius: 32)),
              const SizedBox(
                width: 18,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentUser.username,
                      overflow: TextOverflow.ellipsis,
                      style: kBold.copyWith(
                        fontSize: 21,
                        color: kDarkBlue,
                      ),
                    ),
                    Text(
                      currentUser.email,
                      overflow: TextOverflow.ellipsis,
                      style: kRegular.copyWith(
                        fontSize: 18,
                        color: kGrey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Column(
          children: [
            ProfileListTile(
              onTap: () {},
              title: 'My orders',
              subtitle: 'Already have 0 orders',
            ),
            ProfileListTile(
              onTap: () {},
              title: 'My reviews',
              subtitle: 'Reviews for 0 items',
            ),
            ProfileListTile(
              onTap: () =>
                  Navigator.of(context).pushNamed(ProfileEditPage.path),
              title: 'Edit profile',
            ),
            ProfileListTile(
              onTap: () =>
                  context.read<AuthBloc>().add(const AuthEvent.logout()),
              title: 'Logout',
            ),
          ],
        ),
      ],
    );
  }
}
