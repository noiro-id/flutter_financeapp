import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        // var monday = DateTime.now();
        // while (monday.weekday != 1) {
        //   monday = monday.subtract((const Duration(days: 1)));
        // }

        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        // final weekDay = monday.add(
        //   Duration(days: index),
        // );
        var totalSum = 0.0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  const Chart(this.recentTransactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map(
              (data) {
                return Flexible(
                  // flex: 1,
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'].toString(),
                      data['amount'] as double,
                      totalSpending == 0.0
                          ? 0.0
                          : (data['amount'] as double) / totalSpending),
                );
              },
            ).toList(),
          ),
        ));
  }
}
