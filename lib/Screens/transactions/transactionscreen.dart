import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/transactions/transaction_db.dart';

import '../../models/category/transaction/transaction_model.dart';

class Transactionscreen extends StatelessWidget {
  const Transactionscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();

    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
          return ListView.separated(
              padding: const EdgeInsets.all(10),
              //Values
              itemBuilder: (ctx, index) {
                final value = newList[index];
                return Card(
                  elevation: 0,
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 50,
                      child: Text(
                        '15\nAug',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    title: Text('RS ${value.amount}'),
                    subtitle: Text(value.category.name),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newList.length);
        });
  }
}
