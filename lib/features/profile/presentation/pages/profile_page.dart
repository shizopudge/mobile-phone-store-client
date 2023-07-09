import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../../core/presentation/widgets/other/casual_list_tile.dart';
import '../../../../core/presentation/widgets/other/user_image.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'profile_edit_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final currentUser =
        context.select<AuthBloc, CurrentUser?>((bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: const CasualAppBar(
        title: 'My profile',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(20)),
              child: Row(
                children: [
                  if (currentUser?.image != null)
                    Hero(
                      tag: 'user_image',
                      child: UserImage(
                        image: currentUser?.image,
                        radius: SizeConfig.radiusMedium,
                      ),
                    ),
                  if (currentUser?.image != null)
                    const SizedBox(
                      width: 12,
                    ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser?.username ??
                              'There should be your username',
                          overflow: TextOverflow.ellipsis,
                          style: kBold.copyWith(
                            fontSize: SizeConfig.h3,
                            color: kDarkBlue,
                          ),
                        ),
                        Text(
                          currentUser?.email ?? 'There should be your email',
                          overflow: TextOverflow.ellipsis,
                          style: kRegular.copyWith(
                            fontSize: SizeConfig.h3,
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
            SizedBox(
              height: SizeConfig.setPadding(20),
            ),
            Column(
              children: [
                CasualListTile(
                  onTap: () {},
                  title: 'My orders',
                  subtitle: 'Already have 0 orders',
                ),
                CasualListTile(
                  onTap: () {},
                  title: 'My reviews',
                  subtitle: 'Reviews for 0 items',
                ),
                CasualListTile(
                  onTap: () =>
                      Navigator.of(context).pushNamed(ProfileEditPage.path),
                  title: 'Edit profile',
                ),
                CasualListTile(
                  onTap: () =>
                      context.read<AuthBloc>().add(const AuthEvent.logout()),
                  title: 'Logout',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
