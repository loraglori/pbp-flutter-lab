import 'package:flutter/material.dart';
import 'dart:collection';

class Budget {
  const Budget(this._namaBudget, this._jumlahBudget, this._statusBudget);

  final String _namaBudget;
  final int _jumlahBudget;
  final String _statusBudget;
}

class BudgetModel extends ChangeNotifier {
  final List<Budget> _budgets = [];
  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgets);
  void add(Budget budget) {
    _budgets.add(budget);
  }
}
