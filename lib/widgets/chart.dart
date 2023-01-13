import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  late final List<Transaction> recentTrasaction;
  Chart(this.recentTrasaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;

      for (var i; i < recentTrasaction.length; i++) {
        if (recentTrasaction[i].date.day == weekDay.day &&
            recentTrasaction[i].date.month == weekDay.month &&
            recentTrasaction[i].date.year == weekDay.year) {
          totalSum += recentTrasaction[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
