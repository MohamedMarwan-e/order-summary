import 'package:flutter/material.dart';

import '../../../../core/dependency_injection.dart';
import '../../../../core/utils/responsive.dart';
import '../manager/orders_cubit.dart';
import 'widgets/bar_chart.dart';

class OrdersChartView extends StatelessWidget {
  const OrdersChartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = di<OrdersCubit>();

    return Scaffold(
      appBar: AppBar(
          title: Text('Orders Analysis',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white
              )),
          automaticallyImplyLeading: Responsive.isMobile(context)
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: OrdersBarChart(
            xLabels: cubit.xLabels,
            yValues: cubit.yValues,
          ),
        ),
      ),
    );
  }
}