import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 30),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: const EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: const EdgeInsets.all(10),
                //         child: Text(
                //           '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6,
                //           ),
                //           Text(
                //             DateFormat()
                //                 .add_yMMMd()
                //                 .format(transactions[index].date),
                //             style: const TextStyle(
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
              // children: transactions.map(
              //   (tx) {
              //     return
              //   }
              // ).toList(),
            ),
    );
  }
}
