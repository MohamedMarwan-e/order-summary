part of '../../orders_view.dart';

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = di<OrdersCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StatisticsCard(
          title: 'Total Orders',
          value: '${cubit.totalOrders}',
        ),
        StatisticsCard(
          title: 'Avg. Price',
          value: cubit.averagePrice.toStringAsFixed(2),
        ),
        StatisticsCard(
          title: 'Returned Orders',
          value: '${cubit.returnCount}',
        ),
      ],
    );
  }
}
