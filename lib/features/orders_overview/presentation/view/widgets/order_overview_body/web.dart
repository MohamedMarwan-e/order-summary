part of '../../orders_view.dart';

class Web extends StatelessWidget {
  const Web({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = di<OrdersCubit>();
    final media = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StatisticsCard(
          title: 'Total Orders',
          value: '${cubit.totalOrders}',
          width: media.width * 0.3,
        ),
        StatisticsCard(
          title: 'Avg. Price',
          value: cubit.averagePrice.toStringAsFixed(2),
          width: media.width * 0.3,
        ),
        StatisticsCard(
          title: 'Returned Orders',
          value: '${cubit.returnCount}',
          width: media.width * 0.3,
        ),
      ],
    );
  }
}
