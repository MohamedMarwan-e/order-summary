part of '../orders_view.dart';

class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cubit = di<OrdersCubit>();

    return SafeArea(
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is FetchOrdersSuccess) {
            return const Center(
              child: Responsive(
                web: Web(),
                mobile: Mobile()
              ),
            );
          } else if (state is FetchOrdersError) {
            return const Center(child: Text('Failed to load orders.'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}