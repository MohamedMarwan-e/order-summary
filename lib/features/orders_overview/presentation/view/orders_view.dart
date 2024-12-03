import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:order_summary/core/navigation/app_router.dart';

import '../../../../core/dependency_injection.dart';
import '../../../../core/utils/responsive.dart';
import '../manager/orders_cubit.dart';
import 'widgets/statistics_card.dart';

part 'widgets/order_overview_body.dart';
part 'widgets/order_overview_body/web.dart';
part 'widgets/order_overview_body/mobile.dart';

class OrdersOverview extends StatefulWidget {
  const OrdersOverview({super.key});

  @override
  State<OrdersOverview> createState() => _OrdersOverviewState();
}

class _OrdersOverviewState extends State<OrdersOverview> {

  @override
  void initState() {
    super.initState();
    di<OrdersCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders Overview',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white
            )),
      ),
      body: _Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFFA726),
        onPressed: ()=> context.pushNamed(ordersChart),
        child: const Icon(
          CupertinoIcons.chart_bar_square,
          color: Colors.white,
        ),
      ),
    );
  }
}