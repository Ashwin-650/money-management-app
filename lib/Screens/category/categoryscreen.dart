import 'package:flutter/material.dart';
import 'package:money_management_app/Screens/category/expense_categoryscreen.dart';
import 'package:money_management_app/Screens/category/income_categoryscreen.dart';
import 'package:money_management_app/db/category/category_db.dart';

class Categoryscreen extends StatefulWidget {
  const Categoryscreen({super.key});

  @override
  State<Categoryscreen> createState() => _CategoryscreenState();
}

class _CategoryscreenState extends State<Categoryscreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'INCOMES',
              ),
              Tab(
                text: 'EXPENSES',
              )
            ]),
        Expanded(
          child: TabBarView(controller: _tabController, children: const [
            IncomeCategoryscreen(),
            ExpenseCategoryscreen()
          ]),
        )
      ],
    );
  }
}
