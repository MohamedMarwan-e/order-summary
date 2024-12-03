import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/orders.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());


  int totalOrders = 0;
  int returnCount = 0;
  double averagePrice = 0;
  List<Order> orders = [];
  Map<String, int> ordersCountByDate = {};
  List<String> xLabels = [];
  List<double> yValues = [];


  Future<List<Order>?> getOrders() async {
    try{
      final jsonString = await rootBundle.loadString('assets/json/orders.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      orders = jsonList.map((json) => Order.fromJson(json)).toList();
      calculateMetrics();
      groupOrdersByMonthAndYear();
      emit(FetchOrdersSuccess());
      return orders;
    }catch (e){
      debugPrint('$e');
      emit(FetchOrdersError());
      return null;
    }
  }


  Future<void> calculateMetrics() async {
    totalOrders = orders.length ;
    averagePrice = orders.map((order) => order.price).reduce((a, b) => a + b) / totalOrders;
    returnCount = orders.where((order) => order.status == 'RETURNED').length;
  }

  void groupOrdersByMonthAndYear() {
    ordersCountByDate = {};

    for (final order in orders) {
      if (order.status == 'RETURNED') continue;


      final dateParts = order.date.split('-');

      if (dateParts.length >= 2) {
        final monthYear = '${dateParts[1]}-${dateParts[0]}';
        ordersCountByDate[monthYear] = (ordersCountByDate[monthYear] ?? 0) + 1;
      }

    }


    final sortedEntries = ordersCountByDate.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));


    xLabels = sortedEntries.map((entry) => entry.key).toList();
    yValues = sortedEntries.map((entry) => entry.value.toDouble()).toList();
  }

}
