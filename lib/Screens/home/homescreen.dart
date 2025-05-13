import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/add_transaction/screen_add_transaction.dart';
import 'package:money_management_app/Screens/category/category_popup.dart';
import 'package:money_management_app/Screens/category/categoryscreen.dart';
import 'package:money_management_app/Screens/home/widgets/bottomnavigationbar.dart';
import 'package:money_management_app/Screens/transactions/transactionscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    Transactionscreen(),
    Categoryscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'MONEY MANAGER',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: Homescreen.selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, _) {
          return _pages[updatedIndex];
        },
      )),
      bottomNavigationBar: const MoneyBottomnavigationbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('transaction');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
            print('category');

            showCategoryPopup(context);
            //     final _sample = CategoryModel(
            //         name: 'Travel',
            //         type: CategoryType.expense,
            //         id: DateTime.now().microsecondsSinceEpoch.toString());

            //     CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
