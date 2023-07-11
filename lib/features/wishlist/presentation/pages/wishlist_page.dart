import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/styles.dart';
import '../bloc/wishlist_bloc.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<WishlistBloc>().state;
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async => context
              .read<WishlistBloc>()
              .add(const WishlistEvent.refreshWishlist()),
          child: ListView.builder(
              itemCount: state.wishlist.length,
              itemBuilder: (context, index) {
                final product = state.wishlist[index];
                return Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: kBold.copyWith(fontSize: 50, color: kDarkBlue),
                );
              }),
        ),
      ),
    );
  }
}
