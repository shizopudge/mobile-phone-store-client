import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../../core/presentation/widgets/other/casual_list_tile.dart';
import '../../../../core/presentation/widgets/other/user_image.dart';
import '../../../../core/presentation/widgets/pages/unauthorized_page.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../purchases/presentation/bloc/purchases_bloc.dart';
import '../../../purchases/presentation/pages/purchases_page.dart';
import 'profile_edit_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final currentUser =
        context.select<AuthBloc, CurrentUser?>((bloc) => bloc.state.user);
    final int purchasesCount =
        context.select<PurchasesBloc, int>((bloc) => bloc.state.info.itemCount);
    if (currentUser == null) {
      return const UnauthorizedPage();
    } else {
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
                    if (currentUser.image != null)
                      Hero(
                        tag: currentUser.image ?? 'user_image',
                        child: CasualRoundedNetworkImage(
                          image: currentUser.image,
                          radius: SizeConfig.radiusMedium,
                        ),
                      ),
                    if (currentUser.image != null)
                      const SizedBox(
                        width: 12,
                      ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser.username,
                            overflow: TextOverflow.ellipsis,
                            style: kBold.copyWith(
                              fontSize: SizeConfig.h3,
                              color: kDarkBlue,
                            ),
                          ),
                          Text(
                            currentUser.email,
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
                  if (!currentUser.isAdmin)
                    CasualListTile(
                      onTap: () =>
                          Navigator.of(context).pushNamed(PurchasesPage.path),
                      title: 'My purchases',
                      subtitle: 'Already have $purchasesCount purchases',
                    ),
                  if (!currentUser.isAdmin)
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
}
