import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/styles.dart';
import '../bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartBloc>().state;
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<CartBloc>().add(const CartEvent.refreshCart()),
          child: ListView.builder(
              itemCount: state.cart.length,
              itemBuilder: (context, index) {
                final product = state.cart[index];
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
