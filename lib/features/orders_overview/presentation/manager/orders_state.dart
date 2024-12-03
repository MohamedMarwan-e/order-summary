part of 'orders_cubit.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}
final class FetchOrdersSuccess extends OrdersState {}
final class FetchOrdersError extends OrdersState {}
